
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  bool isfolowingPageOpened = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool isDrawerOpen = false;
  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    update();
  }
  void closeDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
    update();
  }
}