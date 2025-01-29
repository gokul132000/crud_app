import 'package:crud_app/widgets/primary_text.dart';
import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textColor = Colors.black,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: label,
          color: AppColors.textColor,
          size: AppDimen.textSize14,
          weight: AppFont.bold,
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
