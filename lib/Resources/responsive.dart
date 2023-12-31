import 'package:flutter/material.dart';

double screenLayout (double size,BuildContext context){
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  double finalSize = size;
  if(height < 850 || width < 480){
    finalSize = finalSize - ((size/100)*40);
    return finalSize;
  }
  else if(height < 850 || width < 420){
    finalSize = finalSize - ((size/100)*65);
    return finalSize;
  }
  else if(height < 700 || width < 420){
    finalSize= finalSize - 10;
    finalSize = finalSize - ((size/100)*95);
    return finalSize;
  }
  else {
    finalSize = finalSize - ((size/100)*10);
    return finalSize;
  }
}