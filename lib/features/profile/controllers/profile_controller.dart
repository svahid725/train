
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/features/main/controllers/main_controller.dart';

class ProfileController extends GetxController{




  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
    update();
  }
}