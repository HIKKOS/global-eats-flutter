import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carrousel extends StatelessWidget {
  const Carrousel({
    super.key,
    required this.children,
  });
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          pageViewKey: const PageStorageKey('carousel'),
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 2500),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          height: double.infinity,
          aspectRatio: 1,
          viewportFraction: 1),
      items: children,
    );
  }
}
