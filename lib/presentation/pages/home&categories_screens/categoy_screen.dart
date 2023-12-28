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
                  style: AppStyles.heading,
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryContainer(
                      height: 77,
                      text: 'All',
                      textPaddingTop: 28,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      height: 77,
                      text: 'Computers',
                      textPaddingTop: 28,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectedCategory.withCubit(
                                category: 'computers'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      height: 77,
                      text: 'Accessories',
                      textPaddingTop: 28,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectedCategory.withCubit(
                                category: 'accessories'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      height: 77,
                      text: 'smartphones',
                      textPaddingTop: 28,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectedCategory.withCubit(category: 'phone'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      height: 77,
                      text: 'Smart objects',
                      textPaddingTop: 28,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectedCategory.withCubit(
                                category: 'smart objects'),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CategoryContainer(
                      height: 77,
                      text: 'Speakers',
                      textPaddingTop: 28,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectedCategory.withCubit(
                                category: 'speakers'),
                          ),
                        );
                      },
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
