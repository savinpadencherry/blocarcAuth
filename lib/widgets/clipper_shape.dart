// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();

    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
