import 'package:flutter/material.dart';

class ColorsUtil {
  static final Shader linearGradient = const LinearGradient(
    colors: <Color>[Color(0xff2b46e8), Color(0xff770e98)],
  ).createShader(const Rect.fromLTWH(100.0, 0.0, 300.0, 0.0));

  static final Shader textGradient = const LinearGradient(
    colors: <Color>[Color(0xff2b46e8), Color(0xff770e98)],
  ).createShader(const Rect.fromLTWH(300.0, 0.0, 300.0, 200.0));
  static final Shader textGradient50 = const LinearGradient(
    colors: <Color>[Color(0xff2b46e8), Color(0xff770e98)],
  ).createShader(const Rect.fromLTWH(300.0, 0.0, 200.0, 200.0));

  static Gradient containerGradient = const LinearGradient(colors: [Color(0xff2b46e8), Color(0xff770e98)]);
  static Gradient buttonGradient = const LinearGradient(colors: [Color(0xff2b46e8), Color(0xff770e98)]);
  static Gradient headerGradient = const LinearGradient(colors: [Color(0xff022048), Color(0xff770e98)]);
  static Color colorCream = const Color(0x20D0BF9B);

}
