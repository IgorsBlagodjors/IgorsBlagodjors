import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/hint_container.dart';
import 'package:flutter/material.dart';

class HomeSalesLW extends StatelessWidget {
  final List<Map<String, dynamic>> listOfItems;
  const HomeSalesLW({super.key, required this.listOfItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 251,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: listOfItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 161,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 40,
                color: Color.fromRGBO(0, 0, 0, 0.04),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 12),
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 12),
                  child: HintContainer(
                    width: 39,
                    height: 22,
                    textWidget: Text(
                      listOfItems[index]['discount'],
                      style: AppStyles.font12Weight500
                          .copyWith(color: AppColors.blueTextColor),
                    ),
                  ),
                ),
              ),
              Container(
                width: 161,
                height: 175,
                color: AppColors.whiteColor,
                child: Center(
                  child: Image.asset(
                    listOfItems[index]['image'],
                  ),
                ),
              ),
              Center(
                child: Text(
                  listOfItems[index]['category'],
                  style: AppStyles.body2BlackText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
