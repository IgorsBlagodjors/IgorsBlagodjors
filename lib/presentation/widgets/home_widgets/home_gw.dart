import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class HomeGW extends StatelessWidget {
  final List<Map<String, dynamic>> item;
  const HomeGW({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 8,
          mainAxisExtent: 196,
        ),
        itemCount: item.length,
        itemBuilder: (context, index) => Container(
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
                child: Center(child: Image.asset(item[index]['image'])),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Text(
                  item[index]['title'],
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
                  item[index]['price'],
                  style: AppStyles.font12Weight500.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
