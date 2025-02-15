import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

void showLocationDialogue(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) {
      final homeState = ref.watch(homeStateProviderProvider);
      final districts = homeState.availableDistricts;
      final selectedDistrict = homeState.selectedDistrict;
      
      return StatefulBuilder(
        builder: (context, setState) {
          final List<LocationData> locations = selectedDistrict != null 
              ? homeState.availableDistricts
                  .where((district) => district.name == selectedDistrict)
                  .first
                  .locations
              : [];

          return Align(
            alignment: Alignment.center,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Container(
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.h),
                decoration: BoxDecoration(
                  color: CustomColors.themeGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Change location',
                      style: getTextStyle(
                        fp: 24,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.white
                      ),
                    ),
                    Gap(6.h),
                    Text(
                      selectedDistrict == null
                          ? 'Please select your district'
                          : 'Please select your location in $selectedDistrict',
                      style: getTextStyle(
                        fp: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.white,
                        overflow: TextOverflow.visible
                      ),
                    ),
                    Gap(12.h),
                    if (selectedDistrict == null) ...[
                      // Show districts
                      ...List.generate(
                        districts.length,
                        (index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ref.read(homeStateProviderProvider.notifier)
                                    .setSelectedDistrict(districts[index].name);
                                });
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(districts[index].name)
                                ),
                              ),
                            ),
                            Gap(10.h)
                          ],
                        )
                      ),
                    ] else ...[
                      // // Show back button
                      InkWell(
                        onTap: () {
                          setState(() {
                            ref.read(homeStateProviderProvider.notifier)
                              .setSelectedDistrict(null);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8
                          ),
                          decoration: BoxDecoration(
                            color: CustomColors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.arrow_back),
                              Gap(8),
                              Text('Back to Districts'),
                            ],
                          ),
                        ),
                      ),
                      Gap(12.h),
                      // Show locations for selected district
                      ...List.generate(
                        locations.length,
                        (index) => Column(
                          children: [
                            InkWell(
                              onTap: () {
                                ref.read(homeStateProviderProvider.notifier)
                                  .setSelectedLocation(locations[index]);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  color: CustomColors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(locations[index].name)
                                ),
                              ),
                            ),
                            Gap(10.h)
                          ],
                        )
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        }
      );
    },
  );
}

showShopDialogue(BuildContext context,) {
  showDialog(
    context: context,
    builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: Material(
          child: Stack(
            children: [

              Image.asset(
                width: 350,
                ImageAssets.dummy,fit: BoxFit.cover,),
            ],
          ),
        ),
      );
    },
  );
}