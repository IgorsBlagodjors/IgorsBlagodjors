import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class CheckoutCategory extends StatelessWidget {
  final String header;
  final String topText;
  final String bottomText;
  final Color? bottomTextColor;
  const CheckoutCategory(
      {super.key,
      required this.header,
      required this.topText,
      required this.bottomText,
      this.bottomTextColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        children: [
          Text(
            header,
            style: AppStyles.font18Weight600.copyWith(
              color: AppColors.blackText,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  topText,
                  style: AppStyles.font16Weight500.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  bottomText,
                  style: AppStyles.font12Weight400.copyWith(
                    color: bottomTextColor ?? AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
