import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/colors.dart';

TextStyle textStyle = TextStyle(
  color: textColor,
  fontSize: 15,
  fontWeight: FontWeight.w800,
  letterSpacing: 1,
  fontFamily: 'IBM'
);


ListTile listTile (
    IconData icon,
    String text,
    Function()? onTap,
    ){
  return ListTile(
    onTap: onTap,
    contentPadding: const EdgeInsets.only(left: 20),
    leading: Icon(icon),
    title: Text(text, style: textStyle,),
    enableFeedback: true,
    iconColor: elevatedButtonColor,
  );
}