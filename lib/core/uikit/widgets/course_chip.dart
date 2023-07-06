import 'package:flutter/material.dart';
import 'package:train/core/utils/text/textThemes.dart';

class CourseChip extends StatelessWidget {
  const CourseChip({
    super.key,
    required this.country,
    required this.label,
  });

  final String country;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 28,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 4, left: 8, right: 4, bottom: 4),
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Image.asset(
              'assets/icons/$country.png',
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(
              label,
              textAlign: TextAlign.end,
              style: bodyBoldWhite(),
            ),
          ),
        ],
      ),
    );
  }
}