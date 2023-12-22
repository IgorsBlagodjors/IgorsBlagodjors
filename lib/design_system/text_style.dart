import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const mainHeadingWithShadow = TextStyle(
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
  static const mainHeading = TextStyle(
    color: AppColors.blackText,
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );
  static const heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.blackText,
  );
  static const body2BlackText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.blackText,
  );
  static const body1darkBlue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlue,
  );
  static const body2darkBlue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.darkBlue,
  );
  static const body2lightBlue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blueTextColor,
  );
  static const font16Weight600 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

  static const font16Weight400 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static const bodyGrey = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
  static const font16Weight500 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const font14Weight500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const font14Weight400 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const font12Weight500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const font12Weight400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static const font12Weight400Grey = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
}
