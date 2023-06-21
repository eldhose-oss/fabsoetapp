import 'package:flutter/material.dart';
import 'package:oet_learning_app/Screens/home_screen.dart';
import 'package:oet_learning_app/Screens/loginPage.dart';
import 'package:oet_learning_app/Screens/main_page.dart';
import 'package:oet_learning_app/Screens/profile_page.dart';
import 'package:oet_learning_app/Screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve( widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget widget;
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) {
      widget = const MainPage();
    }
    else{
      widget = const LoginPage();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Abel',
        primarySwatch: Colors.blue,
      ),
      home: widget,
    );
  }
}
