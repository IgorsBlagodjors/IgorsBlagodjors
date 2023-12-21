import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/home_lw_items.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/home_lw.dart';
import 'package:flutter/material.dart';

class SelectedCategory extends StatelessWidget {
  const SelectedCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 61,
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
                      const Text(
                        'Ascending price',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.greyColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Image.asset('assets/icons/vector.png'),
                      ),
                      Image.asset('assets/icons/change_icon.png'),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 32),
                  child: Text(
                    'Filters',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.greyColor),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 6),
                  child: Image.asset('assets/icons/change_icon.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7, left: 51),
                  child: Image.asset('assets/icons/mise_en_page.png'),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            HomeLW(item: homeLWList),
          ],
        ),
      ),
    );
  }
}
