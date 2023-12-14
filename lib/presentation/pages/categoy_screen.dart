import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/category_container.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 61,
                    left: 4,
                  ),
                  child: ButtonBack(
                    onTap: () {},
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Categories',
                  style: AppStyles.secondaryHeading,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Column(
                  children: [
                    CategoryContainer(
                      text: 'All',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      text: 'Computers',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      text: 'Accessories',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      text: 'Smartphones',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      text: 'Smart objects',
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      text: 'Speakers',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
