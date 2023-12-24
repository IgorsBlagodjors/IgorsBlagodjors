import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/bloc/category_state_cubit.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/selected_category.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/category_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
  static Widget withCubit() => BlocProvider(
        create: (context) => CategoryStateCubit(
          context.read(),
        ),
        child: const CategoryScreen(),
      );
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryStateCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadCategorys();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryStateCubit, CategoryState>(
        builder: (context, state) {
      Widget? child;
      if (state.isLoading) {
        const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state.isError) {
        child = const Center(
          child: Text('Failure error'),
        );
      } else {
        final data = state.items;
        print('DLIZZADASDA ${data.length}');
        child = Column(
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
                  onTap: () {},
                  text: 'All',
                  textPaddingTop: 28,
                ),
                const SizedBox(
                  height: 16,
                ),
                CategoryContainer(
                  height: 77,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SelectedCategory(
                          data: data,
                        ),
                      ),
                    );
                  },
                  text: 'Computers',
                  textPaddingTop: 28,
                ),
                const SizedBox(
                  height: 16,
                ),
                CategoryContainer(
                  height: 77,
                  onTap: () {},
                  text: 'Accessories',
                  textPaddingTop: 28,
                ),
                const SizedBox(
                  height: 16,
                ),
                CategoryContainer(
                  height: 77,
                  onTap: () {},
                  text: 'Smartphones',
                  textPaddingTop: 28,
                ),
                const SizedBox(
                  height: 16,
                ),
                CategoryContainer(
                  height: 77,
                  onTap: () {},
                  text: 'Smart objects',
                  textPaddingTop: 28,
                ),
                const SizedBox(
                  height: 16,
                ),
                CategoryContainer(
                  height: 77,
                  onTap: () {},
                  text: 'Speakers',
                  textPaddingTop: 28,
                ),
              ],
            )
          ],
        );
      }
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: child,
            ),
          ),
        ),
      );
    });
  }
}
