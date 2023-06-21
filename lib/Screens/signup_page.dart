import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oet_learning_app/Authentication%20Resources/Authentication_methods.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Resources/space_create.dart';
import 'package:oet_learning_app/Resources/textformfield.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:oet_learning_app/Screens/home_screen.dart';
import 'package:oet_learning_app/Screens/main_page.dart';
import 'package:oet_learning_app/Screens/profile_page.dart';
import 'package:oet_learning_app/Screens/t_and_c.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //variable declarations
  File? imageSelected;
  late String _selected;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool isDisabled = false;
  late bool isLoading = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.stroke;

  //function to dispose controllers.
  @override
  void dispose(){
    super.dispose();
    fullnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  //function to capture image from camera.
  void pickImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    File file = File(image!.path);
    setState(() {
      imageSelected = file;
    });
  }
  //function to capture image from gallery.
  void pickImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File(image!.path);
    setState(() {
      imageSelected = file;
    });
  }
   //to show text dialog box screen to choose input.
  _displayDialog(BuildContext context) async {
    _selected = await showDialog(context: context, builder: (context){
      return SimpleDialog(
        title: Text('Select an image',
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
        ),
        children: [
          SimpleDialogOption(
            onPressed: (){
              pickImageFromCamera();
              Navigator.pop(context);
            },
            child: Text('Camera',
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  backgroundColor: primaryColor
              ),
            ),
          ),
          SizedBox(height: screenLayout(20, context)),
          SimpleDialogOption(
            onPressed: (){
              pickImageFromGallery();
              Navigator.pop(context);
            },
            child: Text('Gallery',
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  backgroundColor: primaryColor
              ),
            ),
          ),
        ],
      );
    });
  }
  void signUpUser() async {
    String result;
    setState(() {
      isLoading = true;
    });
    result = await AuthMethods().signupUser(
        name: fullnameController.text,
        email: emailController.text,
        password: passwordController.text,
        termsAccepted: isChecked,
        );
    setState(() {
      isLoading = false;
    });
    if(result == 'signup success'){
      if(context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const MainPage()));
      }
    }
    else {
      Fluttertoast.showToast(msg: result);
    }
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: primaryColor
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: screenLayout(300, context)),
            physics: (MediaQuery.of(context).viewInsets.bottom != 0) ?
            const AlwaysScrollableScrollPhysics():
            const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                sizedBox(screenLayout(190, context), 0, context),

                (imageSelected != null)?
                GestureDetector(
                  onTap: (){
                    _displayDialog(context);
                    },
                  child: CircleAvatar(
                    maxRadius: screenLayout(80, context),
                    backgroundImage: FileImage(imageSelected!),
                    backgroundColor: Colors.white70,
                  ),
                )
                    :
                GestureDetector(
                  onTap: (){
                    _displayDialog(context);
                    },
                  child: CircleAvatar(
                    maxRadius: screenLayout(90, context),
                    backgroundColor: Colors.white70,
                    backgroundImage: const AssetImage('Images/user.png'),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    sizedBox(screenLayout(40, context ),0, context),
                  // Text('   Hola...',
                  //   style: TextStyle(
                  //       color: textColor,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: screenLayout(70, context),
                  //       fontFamily: 'FredokaOne'
                  //   ),
                  // ),
                    Text(' Signup to start learning...',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenLayout(30, context),
                      ),
                    ),
                  ],
                ),
                sizedBox(screenLayout(200, context), 0, context),
                sizedBoxWithChild(
                  screenLayout(90, context),
                  screenLayout(600, context),
                  context, TextForm(
                    isPass: false,
                    textEditingController: fullnameController,
                    icon: const Icon(Icons.sort_by_alpha_rounded),
                    textInputType: TextInputType.name,
                    labelText: 'Full Name',
                    hintText: 'Ex : Allison Burgers',
                ),
                ),
                sizedBox(screenLayout(50, context), 0, context),
                sizedBoxWithChild(
                    screenLayout(90, context),
                    screenLayout(600, context),
                    context, TextForm(
                    isPass: false,
                    textEditingController: emailController,
                    icon: const Icon(Icons.email_rounded),
                    textInputType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    hintText: 'abc@gmail.com'
                ),
                ),
                sizedBox(screenLayout(50, context), 0, context),
                sizedBoxWithChild(
                    screenLayout(90, context),
                    screenLayout(600, context),
                    context,
                    TextForm(
                        isPass: true,
                        textEditingController: passwordController,
                        icon: const Icon(Icons.key_rounded),
                        textInputType: TextInputType.visiblePassword ,
                        labelText: 'Password', hintText: 'Length should be atleast 6 characters. ')
                ), //sizedBoxWithChild
                sizedBox(screenLayout(50, context), 0, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MSHCheckbox(
                        value: isChecked,
                      onChanged: (selected){
                      setState(() {
                        isChecked = selected;
                      });
                    },
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        uncheckedColor: Colors.red,
                        checkedColor: Colors.green,
                      )
                    ),
                    sizedBox(0, screenLayout(25, context), context),
                    Text('I accept the ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: textColor,
                        fontFamily: 'FredokaOne'
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                      },
                      child: const Text('Terms & Conditions. ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontFamily: 'FredokaOne'
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBox(50, 0, context),
                FilledButton(
                  onPressed: (){
                    if(emailController.text.isEmpty ||
                        passwordController.text.isEmpty

                    ){
                      Fluttertoast.showToast(
                        msg: 'Kindly fill-up all fields',
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: textColor,
                        textColor: primaryColor,
                      );
                    }
                    else if( fullnameController.text.isEmpty ){
                      Fluttertoast.showToast(msg: 'Kindly accept Terms & Conditions');
                    }
                    else{
                      signUpUser();
                    }

                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(textColor),
                      foregroundColor: MaterialStatePropertyAll<Color>(primaryColor),
                      enableFeedback: true,
                      fixedSize: MaterialStatePropertyAll<Size>(Size(
                        screenLayout(600, context),screenLayout(90, context),
                      )
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (isLoading == false) ?
                      Text('Sign Up',
                        style: TextStyle(
                            letterSpacing: 4,
                            fontSize: screenLayout(40, context),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cabin'
                        ),
                      ) : SpinKitCircle(
                        color: primaryColor,
                        size: screenLayout(60, context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
