import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/lastestSearchList.dart';
import 'package:fake_tech_store/domain/search_lw_items.dart';
import 'package:fake_tech_store/presentation/widgets/last_search_lw.dart';
import 'package:fake_tech_store/presentation/widgets/search_lw.dart';
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
              Text(
                'Search',
                style: AppStyles.font32Weight800.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
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
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Last viewed',
                style: AppStyles.font24Weight700
                    .copyWith(color: AppColors.blackText),
              ),
              SearchLW(item: searchLWList),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lastest search',
                    style: AppStyles.font24Weight700
                        .copyWith(color: AppColors.blackText),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Clean all history',
                          style: AppStyles.font14Weight500.copyWith(
                            color: AppColors.greyColor,
                          ),
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
