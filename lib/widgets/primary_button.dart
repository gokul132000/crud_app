import 'package:crud_app/widgets/primary_text.dart';
import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_dimension.dart';
import '../resource/app_font.dart';

class PrimaryButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String btnText;
  final ButtonTypeEnum buttonTypeEnum;
  const PrimaryButton({super.key, required this.onTap,required this.btnText,this.buttonTypeEnum = ButtonTypeEnum.primaryType});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: buttonTypeEnum.btnBgColor,
          borderRadius: AppDimen.borderRadius,
          border: Border.all(color: AppColors.primaryColor),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        child: PrimaryText(
          text: btnText,
          size: AppDimen.textSize16,
          weight: AppFont.bold,
          color: buttonTypeEnum.btnTextColor,
        ),
      ),
    );
  }
}

enum ButtonTypeEnum {
  outlineType(btnTextColor: AppColors.primaryColor,btnBgColor: AppColors.whiteBgColor),
  primaryType(btnTextColor: AppColors.whiteTextColor,btnBgColor: AppColors.primaryColor);
  final Color btnTextColor;
  final Color btnBgColor;
  const ButtonTypeEnum({required this.btnTextColor,required this.btnBgColor});
}