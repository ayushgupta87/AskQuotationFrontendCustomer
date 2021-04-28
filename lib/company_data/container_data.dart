import 'package:flutter/material.dart';

Color primaryColor = Color(0xFFCADCED);

List<BoxShadow> customShadow = [
  BoxShadow(
      color: Colors.white.withOpacity(0.5),
      spreadRadius: -5,
      offset: Offset(-5, -5),
      blurRadius: 10
  ),
  BoxShadow(
      color: Colors.blue[900].withOpacity(0.2),
      spreadRadius: 2,
      offset: Offset(7, 7),
      blurRadius: 8
  ),
];