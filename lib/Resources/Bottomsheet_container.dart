import 'package:flutter/material.dart';
import 'package:oet_learning_app/Resources/responsive.dart';
import 'colors.dart';

InkWell bottomSheetContainer({
  required BuildContext context,
  required String heading,
  required String path,
  required VoidCallback onTap,
  required double containerWidth,
  required double containerHeight,
}) {
  return InkWell(
    customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            screenLayout(30, context))),
    splashColor: secondaryColor.withOpacity(1),
    onTap: onTap,
    child: Container(
        height: containerHeight,
        width: containerWidth,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: secondaryColor.withOpacity(.2))],
          borderRadius: BorderRadius.circular(
              screenLayout(30, context)),
          color: primaryColor.withOpacity(.5),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenLayout(5,context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(path,
                width: screenLayout(50, context),
              ),
              Text(
                heading,
                style: TextStyle(
                  fontSize: screenLayout(25,context),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: textColor,
                ),
              ),
            ],
          ),
        )
    ),
  );
}