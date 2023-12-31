import 'package:flutter/material.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';

class BorderlessCard extends StatelessWidget {
  const BorderlessCard({
    super.key, required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 112,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:  AppColors.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow:const [
          BoxShadow(
            color:Color(0x022F4526),
            blurRadius: 16,
            offset: Offset(0, 4)
          ),
        ]
      ),
      child: child,
    );
  }
}