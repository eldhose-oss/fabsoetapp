import 'package:flutter/material.dart';
import 'package:oet_learning_app/Authentication%20Resources/Authentication_methods.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Screens/main_page.dart';
import 'package:oet_learning_app/Screens/signup_page.dart';
import 'package:oet_learning_app/Screens/welcome_screen.dart';
import '../Resources/colors.dart';
import '../Resources/space_create.dart';
import '../Resources/textformfield.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late bool isLoading = false;
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signInUser () async {
    setState(() {
      isLoading = true;
    });
    String result = await AuthMethods().signInUser(email: emailController.text, password: passwordController.text);
    if(result == 'login success'){
      setState(() {
        isLoading = false;
      });
      if(context.mounted){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainPage()));
    }
    }
    else{
      Fluttertoast.showToast(msg: result);
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor,primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: screenLayout(300, context)),
          physics: (MediaQuery.of(context).viewInsets.bottom != 0) ?
          const AlwaysScrollableScrollPhysics() :
           const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              sizedBox(300,0,context),
            Container(
              alignment: Alignment.topLeft,
              height: screenLayout(200, context),
              width: screenLayout(600, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello...',
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: screenLayout(70, context),
                      fontFamily: 'FredokaOne'
                    ),
                  ),
                  Text('Please sign in to continue.',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenLayout(30, context),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(
                width: screenLayout(600, context),
                child: TextForm(isPass: false,
                    textEditingController: emailController,
                    icon: const Icon(Icons.email_rounded),
                    textInputType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    hintText: 'abc@gmail.com',
                ),
              ),
              sizedBox(50, 0, context),
              SizedBox(
                width: screenLayout(600, context),
                child: TextForm(isPass: true,
                  textEditingController: passwordController,
                  icon: const Icon(Icons.key_rounded),
                  textInputType: TextInputType.text,
                  labelText: 'Password',
                  hintText: 'Password require at least 6 characters',
                ),
              ),
              SizedBox(height: screenLayout(60, context),),
              FilledButton(
                onPressed: (){
                  if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                    signInUser();
                  }
                  else{
                    Fluttertoast.showToast(msg: 'Fill in all fields.');
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
                    (isLoading)?SpinKitCircle(color: primaryColor,):Text('Sign In',
                      style: TextStyle(
                          letterSpacing: 4,
                          fontSize: screenLayout(40, context),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Cabin'
                      ),
                    ),
                  ],
                ),
              ),
              sizedBox(80, 0,context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: screenLayout(25, context),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen()));
                    },
                    child: Text("  Create one",
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: screenLayout(27, context),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
