import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:fake_tech_store/domain/lastest_search_list.dart';
import 'package:fake_tech_store/domain/search_lw_items.dart';
import 'package:fake_tech_store/presentation/pages/search_section/selected_good.dart';
import 'package:fake_tech_store/presentation/widgets/grey_text.dart';
import 'package:fake_tech_store/presentation/widgets/search_widgets/last_search_lw.dart';
import 'package:fake_tech_store/presentation/widgets/search_widgets/search_lw.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SelectedGood(
                        singleGood: Electronics(
                            id: 'dd',
                            title: 'dd',
                            imageUrl: 'dd',
                            currency: 'ad',
                            priceValue: 'dd'),
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Search',
                  style: AppStyles.mainHeading,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.5),
                  color: const Color(0xFFE0ECF8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 14, left: 24),
                      child: Icon(
                        Icons.search,
                        color: AppColors.blueTextColor,
                        size: 14,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 7,
                        bottom: 7,
                        left: 16,
                      ),
                      child: VerticalDivider(
                        color: Color(0xFFA7A9BE),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What are you looking for ?',
                          hintStyle: AppStyles.font16Weight400
                              .copyWith(color: AppColors.blueTextColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Last viewed',
                style: AppStyles.body2BlackText,
              ),
              const SizedBox(
                height: 16,
              ),
              SearchLW(item: searchLWList),
              const SizedBox(
                height: 32,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lastest search',
                    style: AppStyles.body2BlackText,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GreyTextWidget(
                          text: 'Clean all history',
                          textSize: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              LastSearchLW(lastestSearch: searchList),
            ],
          ),
        ),
      ),
    );
  }
}
