import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:angadiapp/src/features/home_shops/presentation/view/shop_detail_screen.dart';
import 'package:angadiapp/src/features/home_shops/widget/category_skelton.dart';
import 'package:angadiapp/src/features/home_shops/widget/home_widgets.dart';
import 'package:angadiapp/src/features/home_shops/widget/shop_skelton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  static const String _defaultCategory = "All offers";

  @override
  void initState() {
    super.initState();
    _initializeHomeScreen();
  }

  void _initializeHomeScreen() {
    // Use post-frame callback to ensure context is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Set default category during initialization
      ref
          .read(homeStateProviderProvider.notifier)
          .setSelectedCategory(_defaultCategory);

      // Start data loading sequence
      _fetchCategories();
    });
  }

  void _fetchCategories() {
    context.read<HomeBloc>().add(HomeEvent.getCategories());
  }

  void _fetchShops() {
    final homeState = ref.read(homeStateProviderProvider);
    final locationId = homeState.selectedLocation?.id ?? '';
    context.read<HomeBloc>().add(HomeEvent.getShops(locationId));
  }

  void _fetchBanners() {
    final homeState = ref.read(homeStateProviderProvider);
    final locationId = homeState.selectedLocation?.id ?? '';
    context.read<HomeBloc>().add(HomeEvent.getBanners(locationId));
  }

  void _fetchShopOffers() {
    final homeState = ref.read(homeStateProviderProvider);
    final locationId = homeState.selectedLocation?.id ?? '';
    context.read<HomeBloc>().add(HomeEvent.getShopOffers(locationId));
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProviderProvider);

    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeBlocState>(
        listener: _blocListener,
        builder: (context, state) => _buildBody(context, state, homeState),
      ),
    );
  }

  // Extracted bloc listener logic with improved error handling
  void _blocListener(BuildContext context, HomeBlocState state) {
    final notifier = ref.read(homeStateProviderProvider.notifier);
    final homeProviderState = ref.watch(homeStateProviderProvider);
    final selectedLocationId = homeProviderState.selectedLocation?.id ?? '';

    state.maybeWhen(
      loadedBanners: (response) {
        if (response.isNotEmpty) {
          final bannerImages = response
              .where((banner) => banner.locationId == selectedLocationId)
              .map((banner) =>
                  banner.images.isNotEmpty ? banner.images.first ?? "" : "")
              .where((image) => image.isNotEmpty)
              .toList();
          notifier.setAdvertisementBanners(bannerImages);
        }
      },
      loadedCategories: (response) {
        notifier.setAvailableCategories(response);
        _fetchShops();
      },
      loadedShops: (response) {
        notifier.setAvailableShops(response.shops);
        _fetchBanners();
        _fetchShopOffers();
      },
      loadedShopOffers: (response) {
        if (response.offers.isNotEmpty) {
          notifier.setShopOffer(response.offers[0].offers);
        }
      },
      orElse: () {},
    );
  }

  Widget _buildBody(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          const HomeBackgroundCircle(),
          _buildMainContent(context, state, homeState),
        ],
      ),
    );
  }

  Widget _buildMainContent(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    final hasSelectedLocation = homeState.selectedLocation != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(40.h),
        _buildHeader(homeState),
        Gap(20.h),
        if (hasSelectedLocation) ...[
          _buildCarousel(homeState),
          Gap(15.h),
          _buildShopLogosStories(state, homeState),
          Gap(15.h),
          _buildCategoriesSection(state, homeState),
          Gap(10.h),
          Expanded(
            child: _buildShopsGrid(context, state, homeState),
          ),
        ] else
          _buildLocationSelectionPrompt(),
        Gap(20.h),
      ],
    );
  }

  Widget _buildHeader(HomeState homeState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: HomeHeader(homeState: homeState, logo: ImageAssets.logo),
    );
  }

  Widget _buildCarousel(HomeState homeState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: HomeCarouselSlider(homeState: homeState),
    );
  }

  Widget _buildShopLogosStories(HomeBlocState state, HomeState homeState) {
    return state.maybeWhen(
      loadingShops: () => _buildShopLogosShimmer(),
      errorShops: (error) => const SizedBox(), // Hide on error
      orElse: () {
        if (homeState.availableShops.isEmpty) {
          return const SizedBox(); // Hide if no shops
        } else {
          return ShopLogosStories(shops: homeState.availableShops);
        }
      },
    );
  }

  Widget _buildShopLogosShimmer() {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                Gap(8.h),
                Container(
                  height: 10.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.grey[300],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocationSelectionPrompt() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on_outlined, size: 48.sp, color: Colors.grey),
            Gap(12.h),
            Text(
              'Please select a location',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            Gap(8.h),
            Text(
              'Select a location to browse shops and offers',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(HomeBlocState state, HomeState homeState) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: state.maybeWhen(
        loadingCategories: () => buildCategoryShimmer(),
        errorCategories: (error) =>
            _buildErrorWidget("Failed to load categories"),
        orElse: () => homeState.availableCategories.isEmpty
            ? buildCategoryShimmer()
            : HomeCategoriesRow(
                homeState: homeState,
                ref: ref,
              ),
      ),
    );
  }

  Widget _buildShopsGrid(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    final shops = homeState.filteredShops;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: state.maybeWhen(
        loadingShops: () => buildShopShimmer(6),
        errorShops: (error) => _buildErrorWidget("Failed to load shops"),
        orElse: () =>
            shops.isEmpty ? const HomeEmptyState() : ShopsGrid(shops: shops),
      ),
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 40.sp, color: Colors.red[300]),
          Gap(8.h),
          Text(
            message,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            textAlign: TextAlign.center,
          ),
          Gap(12.h),
          ElevatedButton(
            onPressed: _fetchCategories,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

// New widget for shop logos in Instagram stories style
class ShopLogosStories extends StatelessWidget {
  final List<dynamic> shops;

  const ShopLogosStories({Key? key, required this.shops}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: shops.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              final shop = shops[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeEvent.getShopOffers(shop.id));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ShopDetailScreen(
                            shop: shop,
                          )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(28.r),
                            child: shop.logo != null && shop.logo.isNotEmpty
                                ? Image.network(
                                    shop.logo,
                                    width: 56.w,
                                    height: 56.h,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: Icon(
                                          Icons.store,
                                          size: 30.sp,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    color: Colors.grey[200],
                                    child: Icon(
                                      Icons.store,
                                      size: 30.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
