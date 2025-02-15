import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension ShimmerExtensions on Widget {
  Widget shimmerEffect({
    Color? baseColor,
    Color? highlightColor,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.grey[100]!,
      child: this,
    );
  }
}