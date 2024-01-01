import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/home_sales_lw.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state_cubit.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/categoy_screen.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/fav_items_page.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/home_carousel_slider.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/home_category_icon.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/home_sales_lw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryHomeState();
  static Widget withCubit() => BlocProvider(
        create: (context) => CategoryStateCubit(
          context.read(),
        ),
        child: const CategoryHome(),
      );
}

class _CategoryHomeState extends State<CategoryHome> {
  late final CategoryStateCubit _cubit;
  final List<String> carouselSliderItemCategory = [
    'speakers',
    'laptops',
    'apple',
    'wash mashie'
  ];

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadCarouselItems(carouselSliderItemCategory);
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
          child = Carousel(items: data);
        }
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Text(
                        'Home',
                        style: AppStyles.mainHeadingWithShadow,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    child,
                    const SizedBox(
                      height: 29,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CategoryIcon(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CategoryScreen(),
                                ),
                              );
                            },
                            imageWidth: 18,
                            imageHeight: 12,
                            iconData: Icons.list,
                            image: 'assets/icons/list_icon.png',
                            prescription: 'Categories',
                          ),
                        ),
                        Expanded(
                          child: CategoryIcon(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => FavItems.withCubit(),
                                ),
                              );
                            },
                            imageWidth: 19.9,
                            imageHeight: 19,
                            iconData: Icons.star_border,
                            image: 'assets/icons/star_border.png',
                            prescription: 'Favorites',
                          ),
                        ),
                        Expanded(
                          child: CategoryIcon(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Under Construction'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            },
                            imageWidth: 18,
                            imageHeight: 19,
                            iconData: FontAwesomeIcons.gift,
                            image: 'assets/icons/gift.png',
                            prescription: 'Gifts',
                          ),
                        ),
                        Expanded(
                          child: CategoryIcon(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Under Construction'),
                                  duration: Duration(seconds: 5),
                                ),
                              );
                            },
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
                    HomeSalesLW(
                      listOfItems: homeSalesLW,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
