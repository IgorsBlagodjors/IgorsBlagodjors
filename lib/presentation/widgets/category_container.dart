import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final Function() onTap;
  final String text;
  final double height;
  final double textPaddingTop;
  const CategoryContainer(
      {super.key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.textPaddingTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 40,
              color: Color.fromRGBO(0, 0, 0, 0.04),
            ),
          ],
          color: AppColors.themeColorWhite,
        ),
        height: height,
        child: Padding(
          padding: EdgeInsets.only(top: textPaddingTop, left: 24),
          child: Text(
            text,
            style: AppStyles.body2BlackText,
          ),
        ),
      ),
    );
  }
}
