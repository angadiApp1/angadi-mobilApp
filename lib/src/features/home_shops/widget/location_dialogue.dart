import 'package:angadiapp/core/constants/assets.dart';
import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:angadiapp/src/features/home_shops/data/response/get_location_response_model.dart';
import 'package:angadiapp/src/features/home_shops/presentation/bloc/bloc/home_bloc.dart';
import 'package:angadiapp/src/features/home_shops/presentation/provider/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LocationSelectorDialog extends StatefulWidget {
  final WidgetRef ref;

  const LocationSelectorDialog({
    Key? key,
    required this.ref,
  }) : super(key: key);

  @override
  State<LocationSelectorDialog> createState() => _LocationSelectorDialogState();
}

class _LocationSelectorDialogState extends State<LocationSelectorDialog> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final homeState = ref.watch(homeStateProviderProvider);
        final districts = homeState.availableDistricts;
        final selectedDistrict = homeState.selectedDistrict;

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (selectedDistrict != null)
                        InkWell(
                          onTap: () {
                            ref
                                .read(homeStateProviderProvider.notifier)
                                .setSelectedDistrict(null);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: CustomColors.white,
                          ),
                        ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Change location',
                            style: getTextStyle(
                                fp: 24,
                                fontWeight: FontWeight.w500,
                                color: CustomColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(6.h),
                  Text(
                    selectedDistrict == null
                        ? 'Select District'
                        : 'Select Location',
                    style: getTextStyle(
                        fp: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.white,
                        overflow: TextOverflow.visible),
                  ),
                  Gap(12.h),
                  if (selectedDistrict == null)
                    // Show Districts List
                    ...List.generate(
                        districts.length,
                        (index) => Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(
                                            homeStateProviderProvider.notifier)
                                        .setSelectedDistrict(
                                            districts[index].name);
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: CustomColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(districts[index].name)),
                                  ),
                                ),
                                Gap(8.h)
                              ],
                            ))
                  else
                    // Show Locations List
                    ...List.generate(
                        locations.length,
                        (index) => Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(
                                            homeStateProviderProvider.notifier)
                                        .setSelectedLocation(locations[index]);
                                    context
                                        .read<HomeBloc>()
                                        .add(const HomeEvent.getCategories());
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: CustomColors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(locations[index].name)),
                                  ),
                                ),
                                Gap(8.h)
                              ],
                            )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeBlocEvent {}

// Update your showLocationDialogue function
void showLocationDialogue(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (context) => LocationSelectorDialog(ref: ref),
  );
}
