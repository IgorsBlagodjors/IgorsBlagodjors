import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/grey_text.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/home_gw.dart';
import 'package:flutter/material.dart';

class SelectedCategory extends StatelessWidget {
  final List<Electronics> data;
  const SelectedCategory({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 29,
                  right: 4,
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
              const Text(
                'Laptop',
                style: AppStyles.heading,
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                children: [
                  Container(
                    height: 33,
                    width: 151,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.greyColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 16),
                          blurRadius: 240,
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const GreyTextWidget(
                          text: 'Ascending price',
                          textSize: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          child: Image.asset('assets/icons/vector.png'),
                        ),
                        Image.asset('assets/icons/change_icon.png'),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 8,
                      left: 32,
                    ),
                    child: GreyTextWidget(
                      text: 'Filters',
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 6,
                    ),
                    child: Image.asset(
                      'assets/icons/change_icon.png',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                      left: 51,
                    ),
                    child: Image.asset(
                      'assets/icons/mise_en_page.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              HomeGW(
                data: data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
