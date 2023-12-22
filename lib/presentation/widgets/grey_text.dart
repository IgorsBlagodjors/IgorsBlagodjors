import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class GreyTextWidget extends StatelessWidget {
  final String text;
  final double textSize;
  final FontWeight? fontWeight;
  const GreyTextWidget(
      {super.key, required this.text, required this.textSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: AppColors.greyColor,
      ),
    );
  }
}
