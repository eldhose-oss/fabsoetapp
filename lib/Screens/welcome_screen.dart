import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'package:oet_learning_app/Screens/loginPage.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primaryColor,primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
              width: MediaQuery.of(context).size.height/4,
              child: Image.asset('Images/logo.jpg')
            ),
            SizedBox(
              height: screenLayout(80, context),
            ),
            FilledButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
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
                    Text('Get Started  ',
                      style: TextStyle(
                        letterSpacing: 4,
                        fontSize: screenLayout(40, context),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cabin'
                      ),
                    ),
                    Image.asset('Images/fast-forward.png',width: screenLayout(40, context),height: screenLayout(40, context),)
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}
