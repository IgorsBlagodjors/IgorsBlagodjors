import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
import 'package:fake_tech_store/design_system/constants.dart';
import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  const Carousel({super.key, required this.items});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.items.length,
          options: CarouselOptions(
            height: 110,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentPage = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(6),
                boxShadow: containerShadow,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 36, left: 24),
                        child: Text(
                          widget.items[index]['title'],
                          style: AppStyles.font18Weight600.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 24),
                        child: Text(
                          widget.items[index]['price'],
                          style: AppStyles.font12Weight500.copyWith(
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 40,
                    ),
                    child: Image.asset(
                      widget.items[index]['image'],
                      width: 57,
                      height: 78,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 12,
        ),
        DotsIndicator(
          dotsCount: widget.items.length,
          position: _currentPage,
          decorator: DotsDecorator(
            activeSize: const Size(34, 7),
            size: const Size(34, 7),
            color: AppColors.dotsIndicatorColor.withOpacity(0.32),
            activeColor: AppColors.dotsIndicatorColor,
          ),
        ),
      ],
    );
  }
}
