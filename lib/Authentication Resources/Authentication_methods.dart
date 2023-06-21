import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:oet_learning_app/Models/User_model.dart';

//class to define authentication methods

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //signup function
  Future<String> signupUser({
    required name,
    required email,
    required password,
    required termsAccepted,

}) async {
    String finalResult = 'Some internal error occurred. Try again later.';

    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print(userCredential);
      }
      var userId = userCredential.user!.uid;
      if (kDebugMode) {
        print(userId);
      }
      UserModel userModel = UserModel(
          name: name,
          email: email,
          termsAccepted: termsAccepted,
      );

      await _firebaseFirestore.collection('Users').doc(userId).set(userModel.toJson());
      finalResult = 'signup success';
    }on FirebaseAuthException catch(error){
      if(error.code == 'invalid-email') {
        finalResult = 'Provide a valid E-mail';
      }
      else if(error.code == 'weak-password'){
        finalResult = 'Provide a strong password. (Min 6 characters)';
      }
      else if(error.code == 'user-not-found'){
        finalResult = 'User not registered. Please register or check credentials';
      }
      else if(error.code == 'email-already-in-use'){
        finalResult = "The email address is already in use by another account.";
      }

    } // catch block end
    return finalResult.toString();
  }//signup user

  // sign in user function
Future<String> signInUser({
 required email,
 required password,
}) async {
    String finalResult = 'Login failed. Try again later.';
    try{
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      finalResult = 'login success';
    } on FirebaseAuthException catch(error){
      if(error.code == 'invalid-email') {
        finalResult = 'Provide a valid E-mail';
      }
      else if(error.code == 'weak-password'){
        finalResult = 'Provide a strong password. (Min 6 characters)';
      }
      else if(error.code == 'user-not-found'){
        finalResult = 'User not registered. Please register or check credentials';
      }
      else if(error.code == 'email-already-in-use'){
        finalResult = "The email address is already in use by another account.";
      }
      else if(error.code == 'wrong-password'){
        finalResult = 'Invalid E-mail or Password. Check and try again';
      }
    }
    if (kDebugMode) {
      print(finalResult);
    }//catch block end
    return finalResult.toString();
}

Future<String> logoutUser() async {
    try {
      await _firebaseAuth.signOut();
      return "success";
    } on FirebaseAuthException catch (error){
      return error.toString();
    }
}

}

