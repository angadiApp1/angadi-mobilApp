import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget courouselSlider(HomeState homeState) {
  return SizedBox(
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CarouselSlider(
              items: [
                ...List.generate(
                  homeState.advertisementBanners.length,
                  (index) => Container(
                    color: Colors.black,
                    child: Image.network(
                      homeState.advertisementBanners[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  // indexcontroller.setIndex(index);
                },
                height: 170,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                enableInfiniteScroll: true,
              )),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: DotsIndicator(
            dotsCount: homeState.advertisementBanners.length,
            position: 0,
            decorator: const DotsDecorator(
                color: Colors.white, activeColor: Color(0xFFCFE4D6)),
          ),
        ),
      ],
    ),
  );
}
