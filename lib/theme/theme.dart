import 'package:flutter/material.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color(0xffF6F0C4),
    Colors.pink,
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

Text customText(String val) {
  return Text(
    val,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      foreground: Paint()..shader = linearGradient,
    ),
  );
}
