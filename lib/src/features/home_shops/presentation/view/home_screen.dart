import 'dart:developer';

import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:angadiapp/core/utils/shimmer_extension.dart';
import 'package:angadiapp/src/common_widgets/carousel_slider.dart';
import 'package:angadiapp/src/features/home_shops/data/response/fetch_shops_model.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:angadiapp/src/features/home_shops/widget/category_skelton.dart';
import 'package:angadiapp/src/features/home_shops/widget/location_dialogue.dart';
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
    context.read<HomeBloc>().add(HomeEvent.getLocationData());
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeStateProviderProvider);
    final availableShops = homeState.availableShops;
    return Scaffold(
        body: BlocConsumer<HomeBloc, HomeBlocState>(
      listener: (context, state) {
        state.maybeWhen(
          loadedBanners: (response) {
            ref.read(homeStateProviderProvider.notifier).setAdvertisementBanners(response.map((e) => e.images.first ?? "").toList());
          },
          loadedCategories: (response) {
            ref.read(homeStateProviderProvider.notifier).setAvailableCategories(response);
            context.read<HomeBloc>().add(HomeEvent.getShops(homeState.selectedLocation?.id ?? ''));
          },
          loadedShops: (response) {
            ref.read(homeStateProviderProvider.notifier).setAvailableShops(response.shops);
            context.read<HomeBloc>().add(HomeEvent.getBanners(homeState.selectedLocation?.id ?? ''));
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -166,
                left: -134,
                child: Container(
                  height: 356,
                  width: 362,
                  decoration: const BoxDecoration(
                    color: Color(0xFFCFE4D6),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: _buildHeader(context, homeState),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: courouselSlider(homeState),
                  ),
                  Gap(20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: state.maybeWhen(
                      orElse: () => _buildCategories(homeState),
                      loadingShops: () => buildCategoryShimmer(),
                      loadingCategories: () => buildCategoryShimmer(),
                      errorCategories: (error) => buildCategoryShimmer(),
                      loadedCategories: (response) => _buildCategories(homeState),
                    ),
                  ),
                  Gap(20.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: availableShops.length,
                        itemBuilder: (context, index) {
                          return state.maybeWhen(
                            orElse: () => _buildShops(context, availableShops[index]),
                            loadingShops: () => buildShopShimmer(6),
                            errorShops: (error) => buildShopShimmer(6),
                            loadedShops: (response) => _buildShops(context, availableShops[index]),
                          );
                        }
                      ),
                    ),
                  ),
                  Gap(20.h),
                ],
              ),
            ],
          ),
        );
      },
    ));
  }

  Widget _buildHeader(BuildContext context, HomeState homeState) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
      builder: (context, state) {
        final selectedLocation = homeState.selectedLocation;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              ImageAssets.logo,
              width: 150,
              height: 100,
            ),
            InkWell(
              onTap: () {
                showLocationDialogue(context, ref);
              },
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    selectedLocation?.name ?? 'Select Location',
                    style: getTextStyle(fp: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCategories(HomeState homeState) {
    final availableCategories = homeState.availableCategories;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          availableCategories.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: CustomColors.pattensBlue,
                  width: 2,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: Text(
                availableCategories[index].name,
                style: getTextStyle(fp: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShops(BuildContext context, ShopData shop) {
    return InkWell(
      onTap: () {
        showShopDialogue(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
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
                      shop.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        shop.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
