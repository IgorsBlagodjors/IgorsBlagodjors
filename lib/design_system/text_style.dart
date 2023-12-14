import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const mainHeading = TextStyle(
    color: AppColors.blackText,
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
  static const secondaryHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.blackText,
  );
  static const categoryStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.blackText,
  );
}
