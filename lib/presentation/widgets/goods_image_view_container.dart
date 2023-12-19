import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class GoodsImageViewContainer extends StatelessWidget {
  final Widget child;
  const GoodsImageViewContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 40,
            color: Color.fromRGBO(0, 0, 0, 0.04),
          ),
        ],
      ),
      child: child,
    );
  }
}
