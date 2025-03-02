import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart'; // Make sure to add this dependency

// Create a separate provider for the carousel state
class CarouselProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

Widget carouselSlider(HomeState homeState) {
  // Use a ChangeNotifierProvider for the carousel
  return ChangeNotifierProvider(
    create: (_) => CarouselProvider(),
    child: _CarouselSliderWidget(homeState: homeState),
  );
}

class _CarouselSliderWidget extends StatelessWidget {
  final HomeState homeState;

  const _CarouselSliderWidget({required this.homeState});

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);

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
                    // Update index through the provider
                    carouselProvider.setIndex(index);
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
            child: Consumer<CarouselProvider>(
              builder: (context, provider, _) {
                return DotsIndicator(
                  dotsCount: homeState.advertisementBanners.isEmpty
                      ? 1
                      : homeState.advertisementBanners.length,
                  position: provider.currentIndex,
                  decorator: DotsDecorator(
                      color: Colors.white,
                      activeColor: CustomColors.themeMagenta),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
