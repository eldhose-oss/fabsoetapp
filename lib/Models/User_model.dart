import 'package:flutter/material.dart';

class UserModel{
  final String name;
  final String email;

  final bool termsAccepted;

  UserModel({
   required this.name,
   required this.email,

    required this.termsAccepted
});

  Map<String, dynamic> toJson() => {
    "name" : name,
    "email" : email,
    "termsAccepted" : termsAccepted
  };
}

