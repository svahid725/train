import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/borderless_card.dart';
import 'package:train/core/uikit/widgets/bottom_nav.dart';
import 'package:train/core/uikit/widgets/button.dart';
import 'package:train/core/uikit/widgets/course_chip.dart';
import 'package:train/core/uikit/widgets/course_detail_card.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/courses/screens/course_screen.dart';
import 'package:train/features/main/controllers/main_controller.dart';
import 'package:train/features/profile/controllers/profile_controller.dart';
import 'package:train/features/profile/screens/profile_screen.dart';
import 'package:welltested/annotation.dart';
@Welltested()
class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());
  final ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {

    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: controller.isDrawerOpen ? const SizedBox() : BottomNav() ,
          drawerEnableOpenDragGesture: false,
          backgroundColor: AppColors.surfaceColor,
          body: PageView(
              controller: controller.mainPageController,
              onPageChanged: (value) {
                controller.bottomNavIndex = value;
                controller.update();
              },
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      szdBoxH24,
                      MainScreenTopSlider(controller: controller),
                      szdBoxH24,
                      const BodyWidgets()
                    ],
                  ),
                ),
                CourseScreen(),
                ProfileScreen(),
              ])
        );
      },
    );


  }

}

class MainScreenTopSlider extends StatelessWidget {
  const MainScreenTopSlider({
    super.key,
    required this.controller,
  });

  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 206,
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 194,
                width: Get.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff8D3D001A).withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: PageView.builder(
                  padEnds: false,
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (value) {
                    controller.courseSliderCurrentValue = value;
                    controller.onPageChange(
                      index: value,
                      controller: controller.courseCardsController,
                    );
                  },
                  itemCount: 5,
                  controller: controller.courseCardsController,
                  itemBuilder: (context, index) {
                    return TopSliderItem(index: index,);
                  },
                ),
              ),
            ),
          ],
        ),
        szdBoxH8,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return CustomPageIndicator(
              controller: controller,
              index: index,
              currentValue: controller.courseSliderCurrentValue,
            );
          }),
        ),
      ],
    );
  }
}

class BodyWidgets extends StatelessWidget {
  const BodyWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: BorderlessCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'هدف امروز',
                            style: extraBoldTitleStyle(),
                          ),
                          CircularPercentIndicator(
                            radius: 13.5,
                            percent: 62 / 100,
                            backgroundWidth: 1,
                            lineWidth: 2.5,
                            progressColor: AppColors.mainGreen,
                            backgroundColor: const Color(0xffBFF0DC),
                            animation: true,
                            center: const Text(
                              '62%',
                              style: TextStyle(
                                color: AppColors.mainGreen,
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '۱۶ از  ۲۰ دقیقه',
                        style: body1Style(color: AppColors.darkPrimary9),
                      ),
                      Text(
                        'زمان صرف‌شده آموزش',
                        style: bodyBold2Style(AppColors.darkPrimary9),
                      )
                    ],
                  ),
                ),
              ),
              szdBoxW10,
              Expanded(
                child: BorderlessCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'عملکرد شما',
                        style: extraBoldTitleStyle(),
                      ),
                      szdBoxH8,
                      Image.asset(
                        'assets/images/curve.png',
                        width: 120,
                        height: 38,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        szdBoxH36,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'دوره های جدید و جذاب',
            style: heavyTitleStyle(false),
          ),
        ),
        szdBoxH24,
        const CourseDetailCard()
      ],
    );
  }
}

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.controller,
    required this.currentValue,
    required this.index,
  });

  final int currentValue;
  final MainController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
      height: 7,
      width: 7,
      child: Image.asset(
        controller.icons[index],
        fit: BoxFit.cover,
        colorBlendMode: BlendMode.srcIn,
        color: index == 0
            ? AppColors.darkBlue
            : index == controller.courseSliderCurrentValue
                ? AppColors.orange6
                : Colors.black26,
      ),
    );
  }
}

class TopSliderItem extends StatelessWidget {
  const TopSliderItem({
    super.key, required this.index,
  });
  final int index ;
  @override
  Widget build(BuildContext context) {
    return index == 0 ? Container(height: 194,
      width: 390,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(

        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xff64AFF4),
          Color(0xff5969F8),

        ]) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),): Stack(
      children: [
        Container(
          height: 194,
          width: 390,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: ShapeDecoration(
            color: AppColors.orange6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 116,
                  width: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cardBG.png',
                      ),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      CourseChip(
                        label: 'A2',
                        country: 'usa',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'آموزش زبان انگلیسی - سطح A2',
                        style: boldTitleStyle(true),
                      ),
                      szdBoxH12,
                      Text(
                        '۲۳ از ۳۴ درس مشاهده شدهA2',
                        style: onBGbodyStyle(),
                      ),
                    ],
                  ),
                  szdBoxH12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RoundButton(
                            label: 'ادامه آموزش',
                            onTap: () {},
                            style: boldButtonLabelStyle(AppColors.orange6)),
                      ),
                      szdBoxW10,
                      Expanded(
                        child: RoundButton(
                          label: 'ادامه آموزش',
                          onTap: () {},
                          style: buttonLabelStyle(Colors.white),
                          bGColor: AppColors.orange6,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
  SafeArea buildDrawer(ProfileController controller, BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: const SizedBox.expand(),
          ),
          Drawer(
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
            ),
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: AppColors.borderlessCardShadow,
                    blurRadius: 16,
                    offset: const Offset(0, 4))
              ]),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 21),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => controller.closeDrawer(context),
                    child:  Row(
                      children: [
                        TextButton(onPressed: () {
                          Get.back();
                        }, child:const Row(
                          children: [
                            Icon(Icons.keyboard_arrow_right, color: AppColors.darkPrimary9,),
                            Text(
                              'بستن',
                              style: TextStyle(
                                  color: AppColors.darkPrimary9,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  height: 1),
                            ),
                          ],
                        ), ),

                      ],
                    ),
                  ),
                  szdBoxH36,
                  DrawerBodyItem(
                    svg: 'stroke',
                    onTap: () {},
                    title: 'تنظیمات',
                  ),
                  DrawerBodyItem(
                    svg: 'question',
                    title: 'درباره GO2TRain',
                    onTap: () {},
                  ),
                  DrawerBodyItem(
                    svg: 'telephone',
                    title: 'تماس با ما',
                    onTap: () {},
                  ),
                  DrawerBodyItem(
                    svg: 'mail',
                    title: 'ارسال ایمیل به پشتیبانی',
                    onTap: () {},
                  ),
                  DrawerBodyItem(
                    svg: 'rules',
                    title: 'سیاست‌های حریم خصوصی',
                    onTap: () {},
                  ),
                  DrawerBodyItem(
                    svg: 'FAQ',
                    title: 'سوالات متداول',
                    onTap: () {},
                  ),
                  DrawerBodyItem(
                    svg: 'logout',
                    title: 'خروج از حساب',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
