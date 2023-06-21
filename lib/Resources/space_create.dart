import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/responsive.dart';

Widget sizedBox(double height, double width,  BuildContext context) {
  return SizedBox(
    height: screenLayout(height, context),
    width: screenLayout(width, context),
  );
}

Widget sizedBoxWithChild(double height, double width, BuildContext context, Widget widget){
  return SizedBox(
    height: height,
    width: width,
    child: widget,
  );
}