import 'package:flutter/material.dart';

class OvalClipperUpper extends CustomClipper<Path> {
  Radius? radius;

  OvalClipperUpper(this.radius);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.arcToPoint(
      Offset(size.width, size.height),
      radius: radius != null ? radius! : Radius.elliptical(size.width/4, 4)
    );
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
  
}