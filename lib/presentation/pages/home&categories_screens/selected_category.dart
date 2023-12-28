import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/bloc/category_state.dart';
import 'package:fake_tech_store/presentation/bloc/category_state_cubit.dart';
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
  bool _isLoadingMoreGoods = false;

  @override
  void initState() {
    super.initState();
    _cubit = context.read();
    _cubit.loadCategorys(widget.category);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
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
                scrollController: _scrollController,
                data: data,
                isLoading: state.isLoading,
              ),
            ],
          );
        }
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: child,
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
      _loadMoreGifs();
    }
  }

  void _loadMoreGifs() {
    _isLoadingMoreGoods = true;
    _cubit.loadCategorys(widget.category).then((_) {
      _isLoadingMoreGoods = false;
    });
  }
}
