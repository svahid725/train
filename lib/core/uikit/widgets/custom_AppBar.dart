/*
import 'package:autism/core/utils/text/textThemes.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({
    Key? key,
    this.titleText, this.leading, this.rightPadding, this.titleStyle, this.backGroundColor, this.flexibleSpace,
  }) : super(key: key);

  final String? titleText;
  final IconButton? leading;
  final double? rightPadding ;
  final TextStyle? titleStyle ;
  final Color? backGroundColor;
  final Widget? flexibleSpace;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          SizedBox(width: rightPadding),
          Text(titleText??''),
        ],
      ),
      elevation: 0,
      leading: leading,
      titleTextStyle: titleStyle ?? appBarStyle(),
      backgroundColor: backGroundColor,
      flexibleSpace:flexibleSpace ,
    );
  }
}
*/
