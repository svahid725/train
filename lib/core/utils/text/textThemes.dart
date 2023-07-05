
import 'package:flutter/material.dart';

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

TextStyle whiteBoldTitleStyle() {
  return textStyle(Color(0xffffffff), 18, 1.2, FontWeight.w800);
}

TextStyle onBGbodyStyle() {
  return textStyle(Color(0xffffffff), 12, 1.5, FontWeight.w300);
}
TextStyle bodyBold1Style(Color color) {
  return textStyle(color, 14, 1.5, FontWeight.w700);
}
TextStyle bodyBold2Style(Color color) {
  return textStyle(color, 12, 1.5, FontWeight.w700);
}




