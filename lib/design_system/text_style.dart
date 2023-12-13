import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const kheadingTextStyle = TextStyle(
    color: AppColors.ktextColor,
    fontSize: 32,
    fontWeight: FontWeight.w800,
    shadows: [
      Shadow(
        color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  );
}
