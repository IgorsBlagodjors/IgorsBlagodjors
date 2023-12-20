import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onPresess;
  final Text textClass;
  const AppButton(
      {super.key, required this.onPresess, required this.textClass});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 53,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPresess,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: AppColors.blueTextColor,
          ),
          child: textClass),
    );
  }
}
