import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/features/profile/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
