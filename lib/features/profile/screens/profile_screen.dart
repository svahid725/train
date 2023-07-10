import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/search_bar.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/main/controllers/main_controller.dart';
import 'package:train/features/profile/controllers/folowing_controller.dart';
import 'package:train/features/profile/controllers/profile_controller.dart';
import 'package:train/features/profile/screens/folowing_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();
  final MainController mainController = Get.find();
  final FolowingController folowingController = Get.put(FolowingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: profileController,
      builder: (controller) {
        return profileController.isfolowingPageOpened
            ? folowScreen(profileController, folowingController)
            : Scaffold(
                key: controller.scaffoldKey,
                drawerEnableOpenDragGesture: false,
                extendBodyBehindAppBar: true,
                onDrawerChanged: (isOpened) {
                  if (isOpened) {
                    mainController.isDrawerOpen = true;
                  } else {
                    mainController.isDrawerOpen = false;
                  }
                  mainController.update();
                },
                drawer: buildDrawer(mainController, context),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Container(
                    color: Colors.transparent,
                  ),
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderItems(
                          mainController: mainController,
                          profileController: controller),
                      szdBoxH16,
                      Column(
                        children: [
                          Container(
                            width: Get.width - 40,
                            height: 103,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            decoration: ShapeDecoration(
                              color: AppColors.orange6,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'شما هنوز ایمیل خود را تأیید نکرده‌اید. برای تأیید ایمیل، روی لینک فعال‌سازی که به آدرس mohammadhossein@gmail.com ارسال شده، کلیک کنید.',
                                    textAlign: TextAlign.center,
                                    style: onBGbodyStyle(),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'ویرایش ایمیل',
                                        textAlign: TextAlign.center,
                                        style: bodyBold2Style(
                                            AppColors.darkPrimary9),
                                      ),
                                    ),
                                    szdBoxW16,
                                    Container(
                                      width: 1,
                                      height: 10,
                                      color: Colors.black,
                                    ),
                                    szdBoxW16,
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        'ارسال مجدد ایمیل',
                                        textAlign: TextAlign.center,
                                        style: bodyBold2Style(
                                            AppColors.darkPrimary9),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          szdBoxH16,
                          Container(
                            width: Get.width - 40,
                            height: 76,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('۵۳۲',
                                        textAlign: TextAlign.center,
                                        style: heavyTitleStyle(true)),
                                    Text(
                                      'دنبال کننده',
                                      style:
                                          body1Style(color: AppColors.grayBold),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 51,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '۴۲۲',
                                      textAlign: TextAlign.center,
                                      style: heavyTitleStyle(true),
                                    ),
                                    Text(
                                      'دنبال شده',
                                      style:
                                          body1Style(color: AppColors.grayBold),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 51,
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('جستجو',
                                        textAlign: TextAlign.center,
                                        style: heavyTitleStyle(true).copyWith(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18)),
                                    Text(
                                      'دوستان جدید',
                                      style:
                                          body1Style(color: AppColors.grayBold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          szdBoxH16,
                          Container(
                            width: Get.width - 40,
                            height: 82,
                            padding: const EdgeInsets.fromLTRB(24, 14, 24, 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.darkPrimary9,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('دوره فعال شما',
                                    style: extraBoldTitleStyle()
                                        .copyWith(color: Colors.white)),
                                szdBoxH8,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'آموزش زبان انگلیسی - سطح A2',
                                      style: body1Style(color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Text(
                                            'مشاهده',
                                            style:
                                                body2Style(color: Colors.white)
                                                    .copyWith(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          const Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      szdBoxH10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          szdBoxW20,
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 112,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white10,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/BGroadmap.png'),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'نقشه راه دوره',
                                            style: orangeBoldTitleStyle(),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '۳ از ۱۰',
                                                style: bodyBold2Style(
                                                    Colors.black),
                                              ),
                                              Text(
                                                'ایستگاه کامل شده',
                                                style: body2Style(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Image.asset(
                                            'assets/images/roadmap.png'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          szdBoxW10,
                          Expanded(
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 112,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white10,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/BGroadmap.png'),
                                    alignment: Alignment.bottomLeft,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'لیدربورد',
                                            style: orangeBoldTitleStyle(),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '۲۳ از ۴۰۰',
                                                style: bodyBold2Style(
                                                    Colors.black),
                                              ),
                                              Text(
                                                'موقعیت شما',
                                                style: body2Style(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Image.asset(
                                            'assets/images/roadmap.png'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          szdBoxW20,
                        ],
                      )
                    ],
                  ),
                ),
              );
      },
    );
  }

  SafeArea folowScreen(ProfileController profileController,
      FolowingController folowingController) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: GetBuilder(
            init: folowingController,
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    child: SizedBox(
                      width: 65,
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/svg/arrow_back.svg'),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'پروفایل',
                            style: body1Style(color: AppColors.darkPrimary9)
                                .copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () {
                      profileController.isfolowingPageOpened = false;
                      profileController.update();
                    },
                  ),
                  szdBoxH32,
                  Container(
                    width: Get.width,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.darkPrimary7,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.folowingTabbarIndex = 1;
                              controller.update();
                            },
                            child: Container(
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: controller.folowingTabbarIndex == 1
                                    ? AppColors.darkPrimary7
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                'دنبال‌کننده‌ها',
                                style: bodyBold1Style(
                                    controller.folowingTabbarIndex == 1
                                        ? Colors.white
                                        :  AppColors.darkPrimary7),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.folowingTabbarIndex = 2;
                              controller.update();
                            },
                            child: Container(
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: controller.folowingTabbarIndex == 2
                                      ? AppColors.darkPrimary7
                                      : Colors.white),
                              child: Text(
                                'دنبال‌شده‌ها',
                                style: bodyBold1Style(
                                    controller.folowingTabbarIndex == 2
                                        ? Colors.white
                                        :  AppColors.darkPrimary7),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.folowingTabbarIndex = 3;
                              controller.update();
                            },
                            child: Container(
                              height: 36,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: controller.folowingTabbarIndex == 3
                                    ? AppColors.darkPrimary7
                                    : null,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                'جستجو',
                                style:bodyBold1Style(
                                    controller.folowingTabbarIndex == 3
                                        ? Colors.white
                                        :  AppColors.darkPrimary7),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  szdBoxH24,
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: MySearchBar(
                              hintText: 'جستجو',
                              itemColors: AppColors.darkPrimary2,
                              borderColor: const Color(0xffD7F3FF),
                              controller: controller.searchController),
                        ),
                      ),
                    ],
                  ),
                  szdBoxH16,
                  Container(
                    height: 600,
                    padding: EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 68,
                          width: Get.width,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(top: 8),
                          decoration: BoxDecoration(
                              color: const Color(0xfffcfdfd),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.borderlessCardShadow,
                                  blurRadius: 16,
                                )
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/user.png',
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.users[index].name,
                                    style: extraBoldTitleStyle()
                                        .apply(color: AppColors.darkPrimary9),
                                  ),
                                  Text(
                                    controller.users[index].id,
                                    style: body2Style(
                                        color: AppColors.darkPrimary7),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 24,
                                    alignment: Alignment.center,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFF3E0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/icons/lightining.png'),
                                        const SizedBox(width: 1),
                                        Text(
                                          '۱۹۶ ',
                                          style:
                                              bodyBold2Style(AppColors.orange6),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.users[index].isFolowed == true ?
                                      controller.users[index].isFolowed =false :
                                      controller.users[index].isFolowed = true;
                                      controller.update();
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 24,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                              color: AppColors.mainBlue),
                                          color: controller.users[index].isFolowed
                                              ? AppColors.mainBlue
                                              : AppColors.surfaceColor),
                                      child: SvgPicture.asset(
                                        controller.users[index].isFolowed
                                            ? 'assets/svg/folow.svg'
                                            : 'assets/svg/folowed.svg',
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  szdBoxH32
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  SafeArea buildDrawer(MainController mainController, BuildContext context) {
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
                    onTap: () => profileController.closeDrawer(context),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            mainController.isDrawerOpen = false;
                            mainController.update();
                            // mainController.closeDrawer(context);
                            Get.back();
                          },
                          child: const Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: AppColors.darkPrimary9,
                              ),
                              Text(
                                'بستن',
                                style: TextStyle(
                                    color: AppColors.darkPrimary9,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
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
                    isRed: true,
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

class HeaderItems extends StatelessWidget {
  const HeaderItems({
    super.key,
    required this.mainController,
    required this.profileController,
  });

  final MainController mainController;
  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 176,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/header_card.png',
                    fit: BoxFit.fitWidth,
                    width: Get.width,
                  ),
                  Align(
                    heightFactor: 1.7,
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/profile_image.png',
                      width: 114,
                      height: 114,
                    ),
                  ),
                  Positioned(
                    top: 58,
                    right: 15,
                    child: IconButton(
                      onPressed: () {
                        mainController.isDrawerOpen = true;
                        mainController.openDrawer(context);
                      },
                      icon: SvgPicture.asset('assets/svg/drawer.svg',
                          height: 10, width: 10),
                    ),
                  ),
                  Positioned(
                    top: 58,
                    left: 20,
                    child: IconButton(
                      onPressed: () {
                        profileController.isfolowingPageOpened = true;
                        profileController.update();
                      },
                      icon: Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/alarm.svg',
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(
          'محمدحسین حیدرزاده',
          style: heavyTitleStyle(true),
        ),
        szdBoxH16,
        Container(
          width: 107,
          height: 36,
          padding: const EdgeInsets.only(top: 6, left: 12, right: 8, bottom: 6),
          decoration: ShapeDecoration(
            color: AppColors.milky,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/svg/score.svg',
                width: 15,
                height: 23,
              ),
              Text(
                '۱۹۶ ',
                textAlign: TextAlign.center,
                style: body1Style(color: Colors.black).copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'امتیاز',
                textAlign: TextAlign.center,
                style: body1Style(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerBodyItem extends StatelessWidget {
  DrawerBodyItem({
    super.key,
    required this.svg,
    required this.title,
    required this.onTap,
    this.isRed = false
  });

  final String svg;
  final String title;
  final Function() onTap;
  bool isRed ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title, style: buttonLabelStyle(isRed ? AppColors.error :AppColors.black)),
        contentPadding: const EdgeInsets.only(right: 0),
        horizontalTitleGap: -5,
        trailing: const Icon(
          Icons.arrow_back_ios_new,
          size: 12,
          color: Color(0xff75757A),
        ),
        leading: SvgPicture.asset('assets/svg/$svg.svg'),
        onTap: onTap);
  }
}
