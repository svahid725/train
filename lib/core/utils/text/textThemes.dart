import 'package:flutter/material.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';

TextStyle textStyle(
  Color color,
  double fontSize,
  double? height,
  FontWeight fontWeight,
) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      fontFamily: 'vazir');
}

TextStyle boldTitleStyle(bool isWhite) {
  return textStyle(isWhite ? const Color(0xffffffff) : AppColors.darkPrimary9, 18, 1.2, FontWeight.w800);
}

TextStyle onBGbodyStyle() {
  return textStyle(const Color(0xffffffff), 12, 1.5, FontWeight.w300);
}

TextStyle bodyBold1Style(Color color) {
  return textStyle(color, 14, 1.5, FontWeight.w700);
}

TextStyle bodyBold2Style(Color color) {
  return textStyle(color, 12, 1.5, FontWeight.w700);
}

TextStyle bodyBoldWhite() {
  return textStyle(Colors.white, 14, 1.1, FontWeight.w700);
}

TextStyle buttonLabelStyle(Color color) {
  return textStyle(color, 14, 1.5, FontWeight.w500);
}

TextStyle boldButtonLabelStyle(Color color) {
  return textStyle(color, 14, 1.5, FontWeight.w700);
}

TextStyle extraBoldTitleStyle() {
  return textStyle(AppColors.darkPrimary7, 16, 1.5, FontWeight.w800);
}

TextStyle orangeBoldTitleStyle() {
  return textStyle(AppColors.primaryOrange, 16, 1.4, FontWeight.w800);
}

TextStyle heavyTitleStyle(bool isGray) {
  return textStyle(isGray ? AppColors.grayBold : AppColors.darkPrimary8, 20,
      1.1, FontWeight.w900);
}

TextStyle body1Style({required Color color}) {
  return textStyle(color, 14, 1.5, FontWeight.w300);
}

TextStyle body2Style({required Color color}) {
  return textStyle(color, 12, 1.5, FontWeight.w300);
}

TextStyle lightStyle() {
  return textStyle(AppColors.darkPrimary9, 12, 1.8, FontWeight.w200);
}
