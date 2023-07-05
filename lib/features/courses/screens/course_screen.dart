import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/features/courses/controllers/course_controller.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({Key? key}) : super(key: key);
  final CourseController controller = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
