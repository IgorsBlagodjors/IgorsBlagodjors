import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class HintContainer extends StatelessWidget {
  final double height;
  final double width;
  final Text textWidget;
  const HintContainer({
    super.key,
    required this.height,
    required this.width,
    required this.textWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.lightBlue,
      ),
      child: Center(child: textWidget),
    );
  }
}
