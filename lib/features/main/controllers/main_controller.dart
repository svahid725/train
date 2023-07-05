import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  PageController courseCardsController = PageController(initialPage: 1);
  int currentValue = 1 ;

  void onPageChange(int index){
  courseCardsController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  currentValue = index;
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
