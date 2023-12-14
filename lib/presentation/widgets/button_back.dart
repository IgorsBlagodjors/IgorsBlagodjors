import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  final Function() onTap;
  const ButtonBack({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back,
        size: 27,
        color: AppColors.blackText,
      ),
    );
  }
}
