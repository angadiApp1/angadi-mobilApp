import 'package:angadiapp/core/utils/shimmer_extension.dart';
import 'package:angadiapp/src/features/home_shops/widget/home_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ShopDetailBodySkeleton extends StatelessWidget {
  const ShopDetailBodySkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeBackgroundCircle(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shop info card shimmer
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 150,
                    color: Colors.grey[300],
                  ).shimmerEffect(period: Duration(milliseconds: 1200)),
                  Gap(8.h),
                  Container(
                    height: 16,
                    width: 100,
                    color: Colors.grey[300],
                  ).shimmerEffect(period: Duration(milliseconds: 1300)),
                ],
              ),
            ).shimmerEffect(period: Duration(milliseconds: 1100)),

            // Promotions grid shimmer
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemCount: 2, // Show a fixed number of skeleton items
                itemBuilder: (context, index) {
                  return buildPromotionCardSkeleton(index);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPromotionCardSkeleton(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: Colors.grey[300],
            ).shimmerEffect(
                period: Duration(milliseconds: 1000 + (index * 200))),
          ),
        ),
        Container(
          height: 24,
          padding: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Container(
            height: 12,
            margin: EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey[300],
          ).shimmerEffect(period: Duration(milliseconds: 1200 + (index * 200))),
        ).shimmerEffect(period: Duration(milliseconds: 1100 + (index * 200))),
      ],
    );
  }
}
