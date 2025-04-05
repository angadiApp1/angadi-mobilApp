import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
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
          Gap(20.h),
          _buildCategoriesSection(state, homeState),
          Gap(20.h),
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
