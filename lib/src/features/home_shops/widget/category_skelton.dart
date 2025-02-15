import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/utils/shimmer_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCategoryShimmer() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
        5, // Display 5 shimmer placeholders
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
            child: Container(
              width: 80, // Fixed width for shimmer effect
              height: 20, // Fixed height for shimmer text
              color: Colors.grey[300],
            ).shimmerEffect(period: Duration(milliseconds: 1000 + (index * 200))),
          ),
        ),
      ),
    ),
  );
}