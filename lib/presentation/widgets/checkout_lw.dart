import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/presentation/widgets/hint_container.dart';
import 'package:flutter/material.dart';

class CheckoutLW extends StatelessWidget {
  final List<Map<String, dynamic>> repository;
  const CheckoutLW({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 324,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemCount: repository.length,
        itemBuilder: (context, index) => Container(
          height: 324,
          width: 224,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 40,
                color: Color.fromRGBO(0, 0, 0, 0.04),
              )
            ],
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 16),
                    child: HintContainer(
                      height: 22,
                      width: 34,
                      textWidget: Text(
                        'New',
                        style: AppStyles.font12Weight500
                            .copyWith(color: AppColors.blueTextColor),
                      ),
                    ),
                  ),
                  Container(
                    height: 210,
                    width: double.infinity,
                    color: AppColors.whiteColor,
                    child: Center(
                      child: Image.asset(
                        repository[index]['image'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repository[index]['title'],
                          style: AppStyles.font18Weight600.copyWith(
                            color: AppColors.blackText,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          repository[index]['price'],
                          style: AppStyles.font14Weight500.copyWith(
                            color: AppColors.darkBlue,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          repository[index]['color'],
                          style: AppStyles.font12Weight400.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Image.asset('assets/icons/close_icon.png'),
              ),
              Positioned(
                bottom: 42,
                right: 20,
                child: Container(
                  height: 25,
                  width: 21,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                    child: Text(
                      'x1',
                      style: AppStyles.font14Weight400.copyWith(
                        color: AppColors.darkBlue,
                      ),
                    ),
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
