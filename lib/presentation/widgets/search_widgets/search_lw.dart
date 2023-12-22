import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

import '../../../design_system/app_colors.dart';

class SearchLW extends StatelessWidget {
  final List<Map<String, dynamic>> item;
  const SearchLW({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: item.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemBuilder: (context, index) => Container(
          height: 105,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 40,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.04),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 105,
                width: 135,
                child: Center(child: Image.asset(item[index]['image'])),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item[index]['title'],
                    style: AppStyles.body2BlackText,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    item[index]['price'],
                    style: AppStyles.body2darkBlue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
