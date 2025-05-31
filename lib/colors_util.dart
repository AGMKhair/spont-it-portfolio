import 'package:flutter/material.dart';

class ColorsUtil {
  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff2b46e8), Color(0xff770e98)],
  ).createShader(Rect.fromLTWH(100.0, 0.0, 300.0, 0.0));

  static Gradient containerGradient = new LinearGradient(colors: [Color(0xff2b46e8), Color(0xff770e98)]);
  static Gradient headerGradient = new LinearGradient(colors: [Color(0xff022048), Color(0xff770e98)]);
  static Color colorCream = Color(0x20D0BF9B);
}
