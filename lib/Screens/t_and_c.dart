import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/NavBar.dart';
import 'package:oet_learning_app/Resources/colors.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: Text('Terms & Conditions',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: primaryColor
        ),
        child: const Text('Terms & Conditions'),
      ),
    );
  }
}
