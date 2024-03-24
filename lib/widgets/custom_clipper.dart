import 'package:flutter/material.dart';
class BottomEllipticalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double radius = width / 2;

    Path path = Path();
      path.lineTo(0, height); // Start from top-left corner
    path.quadraticBezierTo(width*0.5, height-60, width, height);
    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}