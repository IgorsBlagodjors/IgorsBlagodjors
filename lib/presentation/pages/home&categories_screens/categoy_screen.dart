import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/selected_category.dart';
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
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Categories',
                  style: AppStyles.font24Weight700,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryContainer(
                      onTap: () {},
                      text: 'All',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SelectedCategory(),
                          ),
                        );
                      },
                      text: 'Computers',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      onTap: () {},
                      text: 'Accessories',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      onTap: () {},
                      text: 'Smartphones',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      onTap: () {},
                      text: 'Smart objects',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      onTap: () {},
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
