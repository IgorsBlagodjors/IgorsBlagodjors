import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final IconData iconData;
  final String image;
  final double imageWidth;
  final double imageHeight;
  final String prescription;
  const Categories({
    super.key,
    required this.iconData,
    required this.prescription,
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.lightBlue,
          radius: 28,
          child: Image.asset(
            image,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          prescription,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.blueTextColor,
          ),
        ),
      ],
    );
  }
}
