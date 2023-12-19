import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentPage;
  const CarouselIndicator({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == 0
                ? AppColors.dotsIndicatorColor
                : AppColors.dotsIndicatorColor.withOpacity(0.32),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == 1
                ? AppColors.dotsIndicatorColor
                : AppColors.dotsIndicatorColor.withOpacity(0.32),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == 2
                ? AppColors.dotsIndicatorColor
                : AppColors.dotsIndicatorColor.withOpacity(0.32),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == 3
                ? AppColors.dotsIndicatorColor
                : AppColors.dotsIndicatorColor.withOpacity(0.32),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: Color.fromRGBO(0, 0, 0, 0.25),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
