

import 'package:get/get.dart';
import 'package:train/features/courses/screens/course_screen.dart';
import 'package:train/features/main/screens/main_screen.dart';
import 'package:train/features/profile/screens/folowing_screen.dart';
import 'package:train/features/profile/screens/profile_screen.dart';


class AppPages {
  static GetPage main = GetPage(
    name: '/',
    page: () => MainScreen(),
  );
  static GetPage profile = GetPage(
    name: '/profile',
    page: () => ProfileScreen(),
  );
  static GetPage course = GetPage(
    name: '/course',
    page: () => CourseScreen(),
  );
  // static GetPage folowing = GetPage(
  //   name: '/folowing',
  //   page: () => FolowingScreen(),
  // );
}