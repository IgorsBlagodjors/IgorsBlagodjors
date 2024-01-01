import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/fav_category_state_cubit.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/add_to_favorite_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavItems extends StatefulWidget {
  const FavItems({super.key});

  @override
  State<FavItems> createState() => _FavItemsState();
  static Widget withCubit() => BlocProvider(
        create: (context) => FavCategoryStateCubit(
          context.read(),
        ),
        child: const FavItems(),
      );
}

class _FavItemsState extends State<FavItems> {
  late final FavCategoryStateCubit _cubit;
  final bool isFavePage = true;
  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadFaveItems();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCategoryStateCubit, CategoryState>(
      builder: (context, state) {
        Widget? child;
        if (state.isLoading) {
          child = const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return const Center(
            child: Text('Failure error'),
          );
        } else if (state.items.isEmpty) {
          child = const Center(
            child: Text('Your Favorite list is empty'),
          );
        } else {
          final data = state.items;
          child = Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 9,
                mainAxisSpacing: 8,
                mainAxisExtent: 196,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 16),
                          blurRadius: 24,
                          color: Color.fromRGBO(0, 0, 0, 0.08),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 143,
                          width: double.infinity,
                          color: AppColors.whiteColor,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: data[index].imageUrl,
                              placeholder: (context, url) => const Center(
                                child: SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.green),
                                    strokeWidth: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text(
                            data[index].title,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.font16Weight600.copyWith(
                              color: AppColors.blackText,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 12,
                          ),
                          child: Text(
                            '${data[index].currency} ${data[index].priceValue}',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.font12Weight500.copyWith(
                              color: AppColors.darkBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 15,
                    top: 15,
                    child: AddToFavoriteStarIcon(
                      mutable: true,
                      onPressed: () {
                        final removedValue = data[index];
                        _cubit.removeFaveItems(data[index]).then((value) {
                          _cubit.loadFaveItems();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Removed'),
                            action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  _cubit.undo(removedValue).then((value) {
                                    _cubit.loadFaveItems();
                                  });
                                }),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 29,
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
                    'Favorite',
                    style: AppStyles.heading,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  child,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
