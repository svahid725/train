import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.label,
    required this.onTap,
    Key? key,
    required this.style, this.bGColor = Colors.white,
  }) : super(key: key);
  final String label;
  final TextStyle style;
  final Color? bGColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 158,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: bGColor,
        border: Border.all(
          color: Colors.white,
          width: 1 ,
        ),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
          elevation: MaterialStatePropertyAll(0),
        ),
        child: Text(
          label,
          style: style,
        ),
      ),
    );
  }
}
