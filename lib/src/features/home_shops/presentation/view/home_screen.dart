import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/core/constants/colors.dart';
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
  @override
  void initState() {
    super.initState();
    // Set default category during initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(homeStateProviderProvider.notifier)
          .setSelectedCategory("All offers");
      context.read<HomeBloc>().add(HomeEvent.getLocationData());
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProviderProvider);

    return Scaffold(
        body: BlocConsumer<HomeBloc, HomeBlocState>(
      listener: _blocListener,
      builder: (context, state) => _buildBody(context, state, homeState),
    ));
  }

  // Extracted bloc listener logic for better readability
  void _blocListener(BuildContext context, HomeBlocState state) {
    final homeState = ref.read(homeStateProviderProvider);
    final notifier = ref.read(homeStateProviderProvider.notifier);

    state.maybeWhen(
      loadedBanners: (response) {
        notifier.setAdvertisementBanners(
            response.map((e) => e.images.first ?? "").toList());
      },
      loadedCategories: (response) {
        notifier.setAvailableCategories(response);
        _fetchShops(homeState);
      },
      loadedShops: (response) {
        notifier.setAvailableShops(response.shops);
        _fetchBanners(homeState);
      },
      orElse: () {},
    );
  }

  // Helper methods for cleaner code
  void _fetchShops(HomeState homeState) {
    context
        .read<HomeBloc>()
        .add(HomeEvent.getShops(homeState.selectedLocation?.id ?? ''));
  }

  void _fetchBanners(HomeState homeState) {
    context
        .read<HomeBloc>()
        .add(HomeEvent.getBanners(homeState.selectedLocation?.id ?? ''));
  }

  // Main body builder
  Widget _buildBody(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          HomeBackgroundCircle(),
          _buildMainContent(context, state, homeState),
        ],
      ),
    );
  }

  // Main content column
  Widget _buildMainContent(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: HomeHeader(homeState: homeState, logo: ImageAssets.logo),
        ),
        Gap(20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: HomeCarouselSlider(homeState: homeState),
        ),
        Gap(20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: _buildCategoriesSection(state, homeState),
        ),
        Gap(20.h),
        Expanded(
          child: _buildShopsGrid(context, state, homeState),
        ),
        Gap(20.h),
      ],
    );
  }

  // Categories section with proper state handling
  Widget _buildCategoriesSection(HomeBlocState state, HomeState homeState) {
    return state.maybeWhen(
      orElse: () => HomeCategoriesRow(
        homeState: homeState,
        ref: ref,
      ),
      loadingShops: () => buildCategoryShimmer(),
      loadingCategories: () => buildCategoryShimmer(),
      errorCategories: (error) => buildCategoryShimmer(),
      loadedCategories: (response) => HomeCategoriesRow(
        homeState: homeState,
        ref: ref,
      ),
    );
  }

  // Shop grid with optimized item building
  Widget _buildShopsGrid(
      BuildContext context, HomeBlocState state, HomeState homeState) {
    final shops = homeState.filteredShops;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: state.maybeWhen(
        loadingShops: () => buildShopShimmer(6),
        orElse: () =>
            shops.isEmpty ? HomeEmptyState() : ShopsGrid(shops: shops),
      ),
    );
  }
}
