import 'package:flutter/material.dart';

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color(0xffF6F0C4),
    Colors.pink,
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

final Shader linearGradient2 = const LinearGradient(
  colors: <Color>[
    Color(0xffF6f0c4),
    Color(0xffF6f0c4),
    // Color.fromARGB(255, 255, 111, 0),
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

Text customText2(String val) {
  return Text(
    val,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      foreground: Paint()..shader = linearGradient2,
    ),
  );
}
