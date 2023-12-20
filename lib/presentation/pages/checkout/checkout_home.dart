import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/app_button.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_category.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_lw.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_widgets/checkout_payment_method.dart';
import 'package:flutter/material.dart';

class CheckoutHome extends StatelessWidget {
  const CheckoutHome({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> fakeRepository = [
      {
        'image': 'assets/iphone.png',
        'title': 'iPhone 11 Pro',
        'price': 'USD 999',
        'color': 'White',
      },
      {
        'image': 'assets/iphone.png',
        'title': 'Airpods Pro',
        'price': 'USD 249',
        'color': 'White',
      },
      {
        'image': 'assets/iphone.png',
        'title': 'iPhone 11 Pro',
        'price': 'USD 999',
        'color': 'White',
      },
      {
        'image': 'assets/iphone.png',
        'title': 'Airpods Pro',
        'price': 'USD 249',
        'color': 'White',
      },
      {
        'image': 'assets/iphone.png',
        'title': 'iPhone 11 Pro',
        'price': 'USD 999',
        'color': 'White',
      },
      {
        'image': 'assets/iphone.png',
        'title': 'Airpods Pro',
        'price': 'USD 249',
        'color': 'White',
      },
    ];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 24),
                child: Text(
                  'Checkout',
                  style: AppStyles.font32Weight800
                      .copyWith(color: AppColors.blackText),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: CheckoutLW(
                  repository: fakeRepository,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const CheckoutCategory(
                header: 'Delivery',
                topText: '12 Madison Avenue, NYC',
                bottomText: 'Fast delivery : 17/11/19',
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Divider(
                  color: AppColors.lightBlue,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const CheckoutPaymentMethod(),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32,
                ),
                child: Divider(
                  color: AppColors.lightBlue,
                ),
              ),
              const CheckoutCategory(
                header: 'Total',
                topText: 'USD 1248',
                bottomText: 'Enter a discount code',
                bottomTextColor: Color(0xFF2DB57D),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: AppButton(
                  onPresess: () {},
                  textClass: Text(
                    'Pay',
                    style: AppStyles.font18Weight600.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
