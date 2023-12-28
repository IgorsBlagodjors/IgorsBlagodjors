import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/constants.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/presentation/bloc/category_state_cubit.dart';
import 'package:fake_tech_store/presentation/widgets/app_button.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/carousel_indicator.dart';
import 'package:fake_tech_store/presentation/widgets/hint_container.dart';
import 'package:fake_tech_store/presentation/widgets/search_widgets/item_color_picker.dart';
import 'package:fake_tech_store/presentation/widgets/search_widgets/selected_item_capacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedGood extends StatefulWidget {
  final Electronics singleGood;
  const SelectedGood({
    super.key,
    required this.singleGood,
  });

  @override
  State<SelectedGood> createState() => _SelectedGoodState();
  static Widget withCubit({required Electronics singleGood}) => BlocProvider(
        create: (context) => CategoryStateCubit(
          context.read(),
        ),
        child: SelectedGood(
          singleGood: singleGood,
        ),
      );
}

class _SelectedGoodState extends State<SelectedGood> {
  late final CategoryStateCubit _cubit;
  bool isBlurred = false;
  SelectedItemParam? selectedCapacity;
  SelectedItemParam? selectedColor;
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<CategoryStateCubit>(context);
  }

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
                    widget.singleGood.title,
                    style: AppStyles.heading,
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
                      child: const HintContainer(
                        height: 25,
                        width: 38,
                        textWidget: Text(
                          'New',
                          style: AppStyles.body2lightBlue,
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
                          CachedNetworkImage(
                            imageUrl: widget.singleGood.imageUrl,
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
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                    ),
                    child: Text(
                      'Color',
                      style: AppStyles.body2BlackText,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemColorPicker(
                        onTap: () {
                          setState(() {
                            selectedColor = SelectedItemParam.first;
                          });
                        },
                        backgroundColor:
                            selectedColor == SelectedItemParam.first
                                ? null
                                : const Color(0xFF171717),
                        borderColor: selectedColor == SelectedItemParam.first
                            ? const Color(0xFF0001FC)
                            : null,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        onTap: () {
                          setState(() {
                            selectedColor = SelectedItemParam.second;
                          });
                        },
                        backgroundColor:
                            selectedColor == SelectedItemParam.second
                                ? null
                                : const Color(0xFF3F427D),
                        borderColor: selectedColor == SelectedItemParam.second
                            ? const Color(0xFF0001FC)
                            : null,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        onTap: () {
                          setState(() {
                            selectedColor = SelectedItemParam.third;
                          });
                        },
                        backgroundColor:
                            selectedColor == SelectedItemParam.third
                                ? null
                                : const Color(0xFFD1C6C6),
                        borderColor: selectedColor == SelectedItemParam.third
                            ? const Color(0xFF0001FC)
                            : null,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      ItemColorPicker(
                        onTap: () {
                          setState(() {
                            selectedColor = SelectedItemParam.fourth;
                          });
                        },
                        backgroundColor:
                            selectedColor == SelectedItemParam.fourth
                                ? null
                                : const Color(0xFFF5F1F1),
                        borderColor: selectedColor == SelectedItemParam.fourth
                            ? const Color(0xFF0001FC)
                            : null,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 32,
                      left: 16,
                    ),
                    child: Text(
                      'Capacity',
                      style: AppStyles.body2BlackText,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectedItemCapacity(
                        onTap: () {
                          setState(() {
                            selectedCapacity = SelectedItemParam.first;
                          });
                        },
                        currentText: '64 gb',
                        isSelected: selectedCapacity == SelectedItemParam.first,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      SelectedItemCapacity(
                        onTap: () {
                          setState(() {
                            selectedCapacity = SelectedItemParam.second;
                          });
                        },
                        currentText: '256 gb',
                        isSelected:
                            selectedCapacity == SelectedItemParam.second,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      SelectedItemCapacity(
                        onTap: () {
                          setState(() {
                            selectedCapacity = SelectedItemParam.third;
                          });
                        },
                        currentText: '512 gb',
                        isSelected: selectedCapacity == SelectedItemParam.third,
                      ),
                      const SizedBox(
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
                      _cubit.addToCard(widget.singleGood);
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
                            const Text(
                              'Product added to cart!',
                              style: AppStyles.heading,
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
