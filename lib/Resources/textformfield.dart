import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/colors.dart';
import 'package:oet_learning_app/Resources/responsive.dart';

class TextForm extends StatelessWidget {
  final bool isPass;
  final TextEditingController textEditingController;
  final Icon icon;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  const TextForm({Key? key,
    required this.isPass,
    required this.textEditingController,
    required this.icon,
    required this.textInputType,
    required this.labelText,
    required this.hintText
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPass,
      enableSuggestions: !isPass,
      decoration: InputDecoration(
        iconColor: secondaryColor,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusColor: primaryColor,
        prefixIcon: icon,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          color: textColor,
          fontSize: screenLayout(20, context),
          fontWeight: FontWeight.w700
        )
      ),
    );
  }
}
