import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCategoryWidget(
  String title, {
  required String selectedCategory,
  required Function(String) onCategorySelected,
}) {
  final bool isSelected = title == selectedCategory;

  return Padding(
    padding: EdgeInsets.only(right: 10.w),
    child: InkWell(
      onTap: () => onCategorySelected(title),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected
                ? CustomColors.themeMagenta
                : CustomColors.pattensBlue,
            width: 2,
          ),
          color: isSelected
              ? CustomColors.themeMagenta.withOpacity(0.1)
              : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: Text(
          title,
          style: getTextStyle(fp: 15, fontWeight: FontWeight.w500),
        ),
      ),
    ),
  );
}
