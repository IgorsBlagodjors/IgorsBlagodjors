import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/carousel_slider_items.dart';
import 'package:fake_tech_store/presentation/widgets/carousel_slider.dart';
import 'package:fake_tech_store/presentation/widgets/category_icon.dart';
import 'package:fake_tech_store/presentation/widgets/sales_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Text(
                    'Home',
                    style: AppStyles.mainHeading,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Carousel(items: carouselSliderItems),
                const SizedBox(
                  height: 29,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Categories(
                        imageWidth: 18,
                        imageHeight: 12,
                        iconData: Icons.list,
                        image: 'assets/icons/list_icon.png',
                        prescription: 'Categories',
                      ),
                    ),
                    Expanded(
                      child: Categories(
                        imageWidth: 19.9,
                        imageHeight: 19,
                        iconData: Icons.star_border,
                        image: 'assets/icons/star_border.png',
                        prescription: 'Favorites',
                      ),
                    ),
                    Expanded(
                      child: Categories(
                        imageWidth: 18,
                        imageHeight: 19,
                        iconData: FontAwesomeIcons.gift,
                        image: 'assets/icons/gift.png',
                        prescription: 'Gifts',
                      ),
                    ),
                    Expanded(
                      child: Categories(
                        imageWidth: 20,
                        imageHeight: 18,
                        iconData: FontAwesomeIcons.user,
                        image: 'assets/icons/best_selling.png',
                        prescription: 'Best selling',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    'Sales',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SalesContainer(
                          image: 'assets/smartphone_picture.png',
                          imageWidth: 61.7,
                          imageHeight: 130,
                          text: 'Smartphones'),
                    ),
                    Expanded(
                      child: SalesContainer(
                          image: 'assets/monitor_picture.png',
                          imageWidth: 97.5,
                          imageHeight: 130,
                          text: 'Monitors'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
