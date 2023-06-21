import 'package:flutter/material.dart';

import 'colors.dart';

Widget sliverToBoxAdaptor (
    double width, double height, Color color
    ){
  return SliverToBoxAdapter(
    child: Padding(
        padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: elevatedButtonColor
        ),
      ),
    ),
  );
}