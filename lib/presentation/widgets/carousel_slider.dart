import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Slider extends StatefulWidget {
  const Slider({super.key});

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [],
      options: CarouselOptions(),
    );
  }
}
