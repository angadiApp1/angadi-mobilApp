
import 'package:angadiapp/core/constants/colors.dart';
import 'package:angadiapp/core/constants/size.dart';
import 'package:flutter/material.dart';

TextStyle getTextStyle({
  double fp = 14,
  double letterSpacing = -0.27,
  double? height,
  TextDecoration decoration = TextDecoration.none,
  Color color = CustomColors.neroBlack,
  FontWeight fontWeight = FontWeight.w500,
  String fontFamily = 'Poppins',
  FontStyle fontStyle = FontStyle.normal,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  return TextStyle(
    fontSize: ScreenSize.fontSize(fp),
    height: height,
    fontFamily: fontFamily,
    color: color,
    fontStyle: fontStyle,
    overflow: overflow,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    decoration: decoration,
    decorationColor: color,
  );
}

TextStyle headerStyle() {
  return getTextStyle(
    fontWeight: FontWeight.w700,
    fp: 17,
    letterSpacing: -0.323,
    height: 1.5,
    overflow: TextOverflow.visible,
  );
}

TextStyle bodyStyle({
  TextDecoration decoration = TextDecoration.none,
  FontWeight fontWeight = FontWeight.w500,
}) {
  return getTextStyle(
    letterSpacing: -0.266,
    height: 1.5,
    color: CustomColors.black80,
    overflow: TextOverflow.visible,
    fontWeight: fontWeight,
    decoration: decoration,
  );
}

TextStyle bodyStyle12() {
  return getTextStyle(
    letterSpacing: -0.228,
    color: CustomColors.black,
    fp: 12,
    height: 1.5,
    overflow: TextOverflow.visible,
  );
}
