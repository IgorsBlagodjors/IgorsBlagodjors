import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/electronics_class.dart';
import 'package:flutter/material.dart';

class HomeGW extends StatelessWidget {
  final List<Electronics> data;
  final bool isLoading;
  final ScrollController scrollController;
  const HomeGW(
      {super.key,
      required this.data,
      required this.isLoading,
      required this.scrollController});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty && !isLoading) {
      return const Expanded(
        child: Center(
          child: Text('Nothing found'),
        ),
      );
    }
    return Expanded(
      child: GridView.builder(
        controller: scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 9,
          mainAxisSpacing: 8,
          mainAxisExtent: 196,
        ),
        itemCount: data.length,
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
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: data[index].imageUrl,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        height: 15,
                        width: 15,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                          strokeWidth: 5,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
      ),
    );
  }

  void test() {}
}
