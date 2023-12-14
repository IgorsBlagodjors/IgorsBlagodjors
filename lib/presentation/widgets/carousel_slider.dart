import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fake_tech_store/design_system/app_colors.dart';
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
                color: AppColors.kcontainerColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 8),
                    blurRadius: 40,
                    color: Color.fromRGBO(0, 0, 0, 0.04),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 36, left: 24),
                        child: Text(
                          widget.items[index]['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, left: 24),
                        child: Text(
                          widget.items[index]['price'],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFE0ECF8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 89),
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
            size: const Size(34, 7),
            color: AppColors.dotsIndicatorColor.withOpacity(0.32),
            activeColor: AppColors.dotsIndicatorColor,
          ),
        ),
      ],
    );
  }
}
