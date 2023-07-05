

import 'package:flutter/material.dart';
import 'package:get/get.dart';
/*
class LoginInput extends StatelessWidget {
  const LoginInput({Key? key,
    this.maxlength,
    required this.label,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.obscureText = false,
    required this.controller,
    this.focusNode,
    this.prefixIconName,
    this.contentTextStyle,
    this.message,
    this.messageStyle,
    this.textDirection = TextDirection.rtl,
    this.contentPadding,
    this.textAlign,
    this.onChanged,
    this.keyboardType,
    this.isBGWhite = false})
      : super(key: key);
  final int? maxlength;
  final String label;
  final String? hintText;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? prefixIconName;
  final TextStyle? contentTextStyle;
  final String? message;
  final TextStyle? messageStyle;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final bool isBGWhite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style:
                isBGWhite ? onSurfaceInputTitle() : onLoginBGInputTitle(),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            height: 52,
            width: Get.width - 50,
            padding: contentPadding,
            decoration: BoxDecoration(
              color: AppThemeColors.surfaceColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppThemeColors.border,
                width: 3,
              ),
            ),
            child: TextField(
              onChanged: onChanged,
              textDirection: textDirection,
              textAlign: textAlign ?? TextAlign.start,
              focusNode: focusNode,
              maxLength: maxlength,
              obscureText: obscureText,
              controller: controller,
              style: contentTextStyle,
              textAlignVertical: TextAlignVertical.center,
              cursorColor: Colors.deepOrangeAccent,
              cursorHeight: 20,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                prefixIcon: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    'assets/icons/$prefixIconName.png',
                  ),
                ),
                suffixIcon: suffixIcon,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            message ?? '',
            style: messageStyle,
          )
        ],
      ),
    );
  }
}
*/
