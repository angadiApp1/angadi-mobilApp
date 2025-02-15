import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension ShimmerExtensions on Widget {
  Widget shimmerEffect({
    Color? baseColor,
    Color? highlightColor,
    Duration? period,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      period: period ?? const Duration(milliseconds: 1500),
      child: this,
    );
  }
}