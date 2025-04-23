import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:angadiapp/src/common_widgets/carousel_slider.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_categories_model.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:angadiapp/src/features/home_shops/presentation/view/shop_detail_screen.dart';
import 'package:angadiapp/src/features/home_shops/widget/category_widget.dart';
import 'package:angadiapp/src/features/home_shops/widget/location_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// Background circle decoration
class HomeBackgroundCircle extends StatelessWidget {
  const HomeBackgroundCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -166,
      left: -134,
      child: Container(
        height: 356,
        width: 362,
        decoration: BoxDecoration(
          color: CustomColors.themeMagenta,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// Header section with location selector
class HomeHeader extends StatelessWidget {
  final HomeState homeState;
  final String logo;

  const HomeHeader({
    Key? key,
    required this.homeState,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedLocation = homeState.selectedLocation;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          logo,
          width: 60,
          height: 60,
        ),
        LocationSelector(selectedLocation: selectedLocation),
      ],
    );
  }
}

// Location selector component
class LocationSelector extends ConsumerWidget {
  final dynamic selectedLocation;

  const LocationSelector({Key? key, required this.selectedLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => showLocationDialogue(context, ref),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        child: Row(
          children: [
            Icon(Icons.location_on_outlined, color: CustomColors.neroBlack),
            Gap(4.w),
            Text(
              selectedLocation?.name ?? 'Select Location',
              style: getTextStyle(fp: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}

// Carousel slider widget
class HomeCarouselSlider extends StatelessWidget {
  final HomeState homeState;

  const HomeCarouselSlider({Key? key, required this.homeState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return carouselSlider(homeState);
  }
}

// Categories row component
class HomeCategoriesRow extends StatelessWidget {
  final HomeState homeState;
  final WidgetRef ref;

  const HomeCategoriesRow({
    Key? key,
    required this.homeState,
    required this.ref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final availableCategories = homeState.availableCategories;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildAllOffersCategory(),
          ...availableCategories
              .map((category) => _buildCategoryItem(category))
              .toList(),
        ],
      ),
    );
  }

  // "All offers" category item
  Widget _buildAllOffersCategory() {
    return buildCategoryWidget(
      "All offers",
      selectedCategory: homeState.selectedCategory,
      onCategorySelected: (category) {
        ref
            .read(homeStateProviderProvider.notifier)
            .setSelectedCategory(category);
      },
    );
  }

  // Individual category item
  Widget _buildCategoryItem(CategoryData category) {
    return buildCategoryWidget(
      category.name,
      selectedCategory: homeState.selectedCategory,
      onCategorySelected: (selectedCategory) {
        ref
            .read(homeStateProviderProvider.notifier)
            .setSelectedCategory(selectedCategory);
      },
    );
  }
}

// Empty state widget
class HomeEmptyState extends StatelessWidget {
  const HomeEmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.store_outlined, size: 64, color: CustomColors.grey),
          Gap(16.h),
          Text(
            "No shops available",
            style: getTextStyle(fp: 16, fontWeight: FontWeight.w500),
          ),
          Gap(8.h),
          Text(
            "Try selecting a different category or location",
            style: getTextStyle(fp: 14, color: CustomColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Shops grid component
class ShopsGrid extends StatelessWidget {
  final List<ShopData> shops;

  const ShopsGrid({Key? key, required this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30,
        crossAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: shops.length,
      itemBuilder: (context, index) => ShopCard(shop: shops[index]),
    );
  }
}

// Shop card component
class ShopCard extends StatelessWidget {
  final ShopData shop;

  const ShopCard({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<HomeBloc>().add(HomeEvent.getShopOffers(shop.id));
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ShopDetailScreen(
                  shop: shop,
                )));
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ShopImageSection(shop: shop),
          ),
          Gap(8.h),
          Align(
            child: Text(
              shop.name,
              style: getTextStyle(
                fp: 14,
                fontWeight: FontWeight.w500,
                color: CustomColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Shop image section
class ShopImageSection extends StatelessWidget {
  final ShopData shop;

  const ShopImageSection({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: CustomColors.pattensBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              shop.thumbnail ?? "",
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  ImageErrorPlaceholder(),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: ShopLogo(logo: shop.logo ?? ''),
        ),
      ],
    );
  }
}

// Shop logo component
class ShopLogo extends StatelessWidget {
  final String logo;

  const ShopLogo({Key? key, required this.logo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          logo,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => ImageErrorPlaceholder(),
        ),
      ),
    );
  }
}

// Image error placeholder
class ImageErrorPlaceholder extends StatelessWidget {
  const ImageErrorPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColors.grey,
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: CustomColors.white,
        ),
      ),
    );
  }
}
