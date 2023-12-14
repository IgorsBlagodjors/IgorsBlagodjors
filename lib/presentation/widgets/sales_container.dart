import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/constants.dart';
import 'package:flutter/material.dart';

class SalesContainer extends StatelessWidget {
  final String image;
  final double imageWidth;
  final double imageHeight;
  final String text;
  const SalesContainer({
    super.key,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 161,
      height: 251,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.whiteColor,
        boxShadow: containerShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, right: 12),
            child: Container(
              width: 39,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.lightBlue,
              ),
              child: const Center(
                child: Text(
                  '-50%',
                  style: TextStyle(
                    color: AppColors.blueTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          Center(
            child: Image.asset(
              image,
              width: imageWidth,
              height: imageHeight,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.blackText,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
