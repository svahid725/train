/*
import 'package:autism/common/spaces_and_numbers.dart';
import 'package:autism/core/uikit/theme/app_themes_color.dart';
import 'package:autism/core/utils/text/textThemes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spaces.buttonHeight,
      width: Get.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
         */
/*   colors: [AppThemeColors.gradientB, AppThemeColors.gradientE],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft),*//*

      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          elevation: MaterialStatePropertyAll(0),
        ),
        child: Text(
          label,
          style: buttonLabelTS(),
        ),
      ),
    );
  }
}
*/
