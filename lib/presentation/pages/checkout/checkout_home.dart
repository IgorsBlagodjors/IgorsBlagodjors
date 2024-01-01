import 'dart:async';
import 'dart:ui';

import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state_cubit.dart';
import 'package:fake_tech_store/presentation/widgets/app_button.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_widgets/checkout_category.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_widgets/checkout_lw.dart';
import 'package:fake_tech_store/presentation/widgets/checkout_widgets/checkout_payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutHome extends StatefulWidget {
  const CheckoutHome({super.key});

  @override
  State<CheckoutHome> createState() => _CheckoutHomeState();
  static Widget withCubit() => BlocProvider(
        create: (context) => CategoryStateCubit(
          context.read(),
        ),
        child: const CheckoutHome(),
      );
}

class _CheckoutHomeState extends State<CheckoutHome> {
  late final CategoryStateCubit _cubit;
  bool isBlurred = false;
  late int _seconds;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    //_cubit.getCheckAndFaveItems(false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryStateCubit, CategoryState>(
        builder: (context, state) {
      Widget? child;
      if (state.isLoading) {
        child = const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.isError) {
        child = const Center(
          child: Text('Failure error'),
        );
      } else {
        final data = state.items;
        child = CheckoutLW(
          repository: data,
        );
      }
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 24),
                      child: Text(
                        'Checkout',
                        style: AppStyles.mainHeading,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: child,
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
                        text: 'Pay',
                        onPresess: () {
                          _startCountdown();
                        },
                      ),
                    ),
                  ],
                ),
                if (isBlurred)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 16,
                        sigmaY: 16,
                      ),
                      child: Container(
                        color: const Color.fromRGBO(1, 53, 235, 0.64),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 180,
                                height: 180,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 16),
                                      blurRadius: 24,
                                      color: Color.fromRGBO(0, 0, 0, 0.08),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Image.asset(
                                      'assets/icons/circle_icon.png'),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Order validate!',
                                style: AppStyles.heading
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Seconds...$_seconds',
                                style: AppStyles.heading
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _startCountdown() {
    setState(() {
      isBlurred = true;
      _seconds = 10;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          isBlurred = false;
          timer.cancel();
        }
      });
    });
  }
}
