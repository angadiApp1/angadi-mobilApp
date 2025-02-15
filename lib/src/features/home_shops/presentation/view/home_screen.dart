import 'dart:developer';

import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:angadiapp/src/common_widgets/carousel_slider.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:angadiapp/src/features/home_shops/widget/location_dialogue.dart';
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
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeBlocState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () => null,
            loadedLocationData: (response) {
              ref.read(homeStateProviderProvider.notifier).setAvailableLocations(response);
            },
            errorLocationData: (message) {
              log(message);
            },
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
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: courouselSlider(),
                        ),
                        Gap(20.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: _buildCategories(),
                        ),
                        
                      ],
                    ),
                    Gap(10.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GridView(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            mainAxisSpacing: 30,
                                            crossAxisSpacing: 10),
                                    children: [
                                      ...List.generate(
                                          10, (index) => _buildShops(context)),
                                    ],
                                  ),
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context , HomeState homeState) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
  builder: (context, state) {
    final selectedLocation = homeState.selectedLocation ?? 
        (homeState.availableLocations.isNotEmpty && homeState.availableLocations.isNotEmpty 
            ? homeState.availableLocations.first 
            : null);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Image.asset(width: 150, height: 100, ImageAssets.logo),
        InkWell(
          onTap: () {
            showLocationDialogue(
              context, 
              ref,
            );
          },
          child: Row(
            children: [
              Icon(Icons.location_on_outlined),
              Text(
                homeState.selectedDistrict ?? 'Select Location',
                style: getTextStyle(fp: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }
);
  }

  Widget _buildCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: List.generate(
              categories.length,
              (index) => Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: CustomColors.pattensBlue, width: 2),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Text(
                          categories[index],
                          style:
                              getTextStyle(fp: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Gap(10.w),
                    ],
                  )),
        ),
      ),
    );
  }

  Widget _buildShops(BuildContext context) {
    return InkWell(
      onTap: () {
        showShopDialogue(
          context,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              color: CustomColors.pattensBlue,
              height: 165,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    ImageAssets.dummy,
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              'Lulu mall',
              style: getTextStyle(
                  fp: 14,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.black),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> categories = ['All offers', 'Supermarkets', 'Restaurents& cafe'];
