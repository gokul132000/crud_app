import 'package:flutter/material.dart';

class AppColors{
  static const Color primaryColor =  Color(0xFF2196F3);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color redColor = Color(0xFFFF5252);
  static const Color whiteIconColor = Color(0xFFFFFFFF);
  static const Color whiteBgColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFE3F2FD);
  static const Color textColor = Color(0xFF141414);
  static const Color shadowColor = Color(0xFFD6D6D6);
  static MaterialColor materialColor = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}