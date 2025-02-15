import 'package:angadiapp/core/utils/shimmer_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

Widget buildShopShimmer(int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: Colors.grey[300],
                ).shimmerEffect(period: Duration(milliseconds: 1000 + (index * 200))),
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
                  child: Container(
                    color: Colors.grey[300],
                  ).shimmerEffect(period: Duration(milliseconds: 1200 + (index * 200))),
                ),
              ),
            ),
          ],
        ),
      ),
      Gap(8.h),
      Align(
        child: Container(
          height: 14,
          width: 100,
          color: Colors.grey[300],
        ).shimmerEffect(period: Duration(milliseconds: 1400 + (index * 200))),
      ),
    ],
  );
}
