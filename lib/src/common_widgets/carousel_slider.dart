import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

Widget courouselSlider() {
  // final carouselIndex indexcontroller = Get.put(carouselIndex());
    return SizedBox(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CarouselSlider(
                  items:  [
                    Container(
                      color: Colors.black,
                      child: const Center(
                          child: Text(
                        'SHOP ADVERTISEMENT BANNER GOES HERE',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    Container(
                      color: Colors.lightBlue,
                    ),
                    Container(
                      color: Colors.red,
                    )
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
                  dotsCount: 3,
                  position: 0,
                  decorator: const DotsDecorator(
                    color: Colors.white,
                    activeColor: Color(0xFFCFE4D6)
                  ),
                ),
              ),
        ],
      ),
    );
  }