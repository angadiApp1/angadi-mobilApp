import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSize {
  ScreenSize._();

  static double width(double percentage) {
    return ScreenUtil().screenWidth * percentage / 100;
  }

  static double height(double percentage) {
    return ScreenUtil().screenHeight * percentage / 100;
  }

  static double fontSize(double value) {
    final fontSize = value.sp;
    if (fontSize > value) {
      return value;
    }
    return fontSize;
  }
}
