import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentPage;
  final bool? enableShadow;
  const CarouselIndicator(
      {super.key, required this.currentPage, this.enableShadow});

  @override
  Widget build(BuildContext context) {
    Color selectedIndicatorColor = AppColors.dotsIndicatorColor;
    Color standardIndicatorColor =
        AppColors.dotsIndicatorColor.withOpacity(0.32);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == 0
                ? selectedIndicatorColor
                : standardIndicatorColor,
            boxShadow: enableShadow == true
                ? [
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ]
                : null,
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
                ? selectedIndicatorColor
                : standardIndicatorColor,
            boxShadow: enableShadow == true
                ? [
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ]
                : null,
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
                ? selectedIndicatorColor
                : standardIndicatorColor,
            boxShadow: enableShadow == true
                ? [
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ]
                : null,
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
                ? selectedIndicatorColor
                : standardIndicatorColor,
            boxShadow: enableShadow == true
                ? [
                    const BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ]
                : null,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
