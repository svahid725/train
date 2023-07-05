

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:train/core/routes/screen_routes.dart';
import 'package:train/core/uikit/theme/theme_data.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      getPages: [
        AppPages.main,
        AppPages.profile,
        AppPages.course
      ],
      theme: themeData,
      initialRoute: AppPages.main.name,
    );
  }
}
