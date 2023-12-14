import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/constants.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String text;
  const CategoryContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: containerShadow,
        color: AppColors.themeColorWhite,
      ),
      height: 77,
      width: 343,
      child: Padding(
        padding: const EdgeInsets.only(top: 28, left: 24),
        child: Text(
          text,
          style: AppStyles.categoryStyle,
        ),
      ),
    );
  }
}
