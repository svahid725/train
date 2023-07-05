import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/features/main/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(

    ));

  }
}
