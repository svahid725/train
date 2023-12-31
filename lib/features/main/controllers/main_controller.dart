import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:train/core/routes/screen_routes.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:welltested/annotation.dart';

@Welltested()
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

    // Get.to(index == 1 ? AppPages.course.page : index == 2 ? AppPages.profile.page : null );
    update();
  }

  final List<String> icons = [
    'assets/icons/lightning.png',
    'assets/icons/home_indicator.png',
    'assets/icons/gray_circle.png',
    'assets/icons/gray_circle.png',
    'assets/icons/gray_circle.png',
  ];

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isDrawerOpen = false;

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    update();

    print('is open : ${isDrawerOpen}');
  }
  void closeDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
    update();
    print('is open : ${isDrawerOpen}');
  }
}
