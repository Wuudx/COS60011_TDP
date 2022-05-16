import 'package:flutter/material.dart';

class CustomTextStyles {
  static buttonText(int textColour) => TextStyle(
        color: Color(textColour),
        fontSize: 15,
      );
  static formTextField(int textColour) => TextStyle(
        color: Color(textColour),
        fontSize: 25,
      );
}
