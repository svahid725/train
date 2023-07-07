import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController courseCardsController = PageController(initialPage: 1);
  PageController mainPageController = PageController(initialPage: 0);
  int courseSliderCurrentValue = 1;

  int bottomNavIndex = 0;

  void onPageChange({
    required int index,
    required PageController controller,
  }) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    update();
  }

  final List<String> icons = [
    'assets/icons/lightning.png',
    'assets/icons/home_indicator.png',
    'assets/icons/gray_circle.png',
    'assets/icons/gray_circle.png',
    'assets/icons/gray_circle.png',
  ];
}
