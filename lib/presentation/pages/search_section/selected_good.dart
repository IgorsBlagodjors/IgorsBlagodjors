import 'dart:ui';

import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/app_button.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/carousel_indicator.dart';
import 'package:fake_tech_store/presentation/widgets/item_color_picker.dart';
import 'package:fake_tech_store/presentation/widgets/selected_item_capacity.dart';
import 'package:flutter/material.dart';

class SelectedGood extends StatefulWidget {
  const SelectedGood({super.key});

  @override
  State<SelectedGood> createState() => _SelectedGoodState();
}

class _SelectedGoodState extends State<SelectedGood> {
  bool isBlurred = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 29,
                      left: 6,
                    ),
                    child: ButtonBack(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'iPhone 11 Pro',
                    style: AppStyles.heading.copyWith(
                      color: AppColors.blackText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 37,
                      left: 16,
                    ),
                    child: Container(
                      height: 25,
                      width: 38,
                      color: const Color(0xFFE0ECF8),
                      child: Center(
                        child: Text(
                          'New',
                          style: AppStyles.font14Weight500.copyWith(
                            color: AppColors.blueTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 264,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/iphone.png',
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          const CarouselIndicator(
                            currentPage: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'Color',
                      style: AppStyles.body2BlackText.copyWith(
                        color: AppColors.blackText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemColorPicker(
                        backgroundColor: Color(0xFF52514F),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        borderColor: Color(0xFF0001FC),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        backgroundColor: Color(0xFF6F7972),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        backgroundColor: Color(0xFFF5D8C0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32,
                      left: 16,
                    ),
                    child: Text(
                      'Capacity',
                      style: AppStyles.body2BlackText.copyWith(
                        color: AppColors.blackText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectedItemCapacity(
                        currentText: '64 gb',
                        color: AppColors.darkBlue,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      SelectedItemCapacity(
                        currentText: '256 gb',
                        color: AppColors.greyColor,
                      ),
                      SizedBox(
                        width: 24,
                      ),
                      SelectedItemCapacity(
                        currentText: '512 gb',
                        color: AppColors.greyColor,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  AppButton(
                    text: 'Add to cart',
                    onPresess: () {
                      setState(() {
                        isBlurred = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (isBlurred)
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 32,
                    sigmaY: 32,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.56),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.shopping_cart_outlined,
                              size: 64,
                              color: AppColors.blackText,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'Product added to cart!',
                              style: AppStyles.heading
                                  .copyWith(color: AppColors.blackText),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            AppButton(
                              text: 'Back to shopping',
                              onPresess: () {
                                setState(() {
                                  isBlurred = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
