import 'package:flutter/material.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/utils/text/textThemes.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({
    super.key,
    required this.hintText,
    required this.itemColors,
    required this.borderColor, required this.controller,
  });

  final String hintText;
  final Color itemColors;
  final Color borderColor;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 256,
      child: TextField(
        textDirection: TextDirection.rtl,
        style: body1Style(color: AppColors.grayText),
        cursorColor: AppColors.orangeFilterButton,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: itemColors,
          ),
          hintText: hintText,
          hintStyle: buttonLabelStyle(itemColors)
              .copyWith(fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.only(top: 4),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}