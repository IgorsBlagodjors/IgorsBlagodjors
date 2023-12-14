import 'package:fake_tech_store/design_system/text_style.dart';
import 'package:fake_tech_store/domain/carousel_slider_items.dart';
import 'package:fake_tech_store/presentation/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({super.key});

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
              const Padding(
                padding: EdgeInsets.only(top: 24),
                child: Text(
                  'Home',
                  style: TextStyles.kheadingTextStyle,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Carousel(items: carouselSliderItems),
            ],
          ),
        ),
      ),
    );
  }
}
