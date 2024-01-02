import 'dart:ui';

import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/pages/home&categories_screens/bloc/category_state_cubit.dart';
import 'package:fake_tech_store/presentation/widgets/button_back.dart';
import 'package:fake_tech_store/presentation/widgets/grey_text.dart';
import 'package:fake_tech_store/presentation/widgets/home_widgets/home_gw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedCategory extends StatefulWidget {
  final String category;
  const SelectedCategory({super.key, required this.category});

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
  static Widget withCubit({required String category}) => BlocProvider(
        create: (context) => CategoryStateCubit(
          context.read(),
        ),
        child: SelectedCategory(
          category: category,
        ),
      );
}

class _SelectedCategoryState extends State<SelectedCategory> {
  late final CategoryStateCubit _cubit;
  late final ScrollController _scrollController;
  late bool descendingOrder;
  late bool _isLoadingMoreGoods;
  late Axis _selectedDirection;
  late bool _textOverflow;
  String selectedOption = 'Filters';
  String selectedValue = 'Filters';

  List<String> items = ['Filters', 'Filners', 'Filzers'];

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    descendingOrder = false;
    _cubit.loadCategories(widget.category, descendingOrder);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _textOverflow = true;
    _selectedDirection = Axis.vertical;
    _isLoadingMoreGoods = false;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryStateCubit, CategoryState>(
      builder: (context, state) {
        Widget? child;
        if (state.isError) {
          child = const Center(
            child: Text('Failure error'),
          );
        } else {
          final data = state.items;
          child = Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                'Laptop',
                style: AppStyles.heading,
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        descendingOrder = !descendingOrder;
                        _cubit.loadCategories(widget.category, descendingOrder);
                      });
                    },
                    child: Container(
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
                          GreyTextWidget(
                            text: descendingOrder
                                ? 'Descending price'
                                : 'Ascending price',
                            textSize: 14,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            child: descendingOrder
                                ? const Icon(
                                    Icons.arrow_upward,
                                    size: 15,
                                    color: AppColors.greyColor,
                                  )
                                : const Icon(
                                    Icons.arrow_downward,
                                    size: 15,
                                    color: AppColors.greyColor,
                                  ),
                          ),
                          const Icon(
                            Icons.expand_more,
                            size: 15,
                            color: AppColors.greyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 32),
                    child: GreyTextWidget(
                      text: 'Filters',
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, left: 6),
                    child: Icon(
                      Icons.expand_more,
                      size: 15,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                      left: 51,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDirection =
                              _selectedDirection == Axis.vertical
                                  ? Axis.horizontal
                                  : Axis.vertical;
                          _textOverflow = !_textOverflow;
                        });
                      },
                      child: Image.asset(
                        'assets/icons/mise_en_page.png',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              HomeGW(
                textOverflow: _textOverflow,
                selectedDirection: _selectedDirection,
                scrollController: _scrollController,
                data: data,
                isLoading: state.isLoading,
              ),
            ],
          );
        }
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: child,
                ),
                if (state.isLoading)
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 2,
                        sigmaY: 2,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.56),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 0.0) {
      FocusScope.of(context).unfocus();
    }
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    double currentScrollExtent = _scrollController.position.pixels;
    double remainingScrollExtent = maxScrollExtent - currentScrollExtent;
    double pixelRemainder = 300;

    if (remainingScrollExtent < pixelRemainder && !_isLoadingMoreGoods) {
      _loadMoreItems();
    }
  }

  void _loadMoreItems() {
    _isLoadingMoreGoods = true;
    _cubit.loadCategories(widget.category, true).then((_) {
      _isLoadingMoreGoods = false;
    });
  }
}
