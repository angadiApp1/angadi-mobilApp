import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CarouselProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

Widget carouselSlider(HomeState homeState) {
  return ChangeNotifierProvider(
    create: (_) => CarouselProvider(),
    child: _CarouselSliderWidget(homeState: homeState),
  );
}

class _CarouselSliderWidget extends StatefulWidget {
  final HomeState homeState;

  const _CarouselSliderWidget({required this.homeState});

  @override
  State<_CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<_CarouselSliderWidget> {
  @override
  void initState() {
    super.initState();
    // _preloadCarouselImages();
  }

  void _preloadCarouselImages() {
    for (String url in widget.homeState.advertisementBanners) {
      precacheImage(CachedNetworkImageProvider(url), context);
    }
  }

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
                  widget.homeState.advertisementBanners.length,
                  (index) => Container(
                    color: Colors.black,
                    child: CachedNetworkImage(
                      imageUrl: widget.homeState.advertisementBanners[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  carouselProvider.setIndex(index);
                },
                height: 170,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                enableInfiniteScroll: true,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Consumer<CarouselProvider>(
              builder: (context, provider, _) {
                return DotsIndicator(
                  dotsCount: widget.homeState.advertisementBanners.isEmpty
                      ? 1
                      : widget.homeState.advertisementBanners.length,
                  position: provider.currentIndex,
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: CustomColors.themeMagenta,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
