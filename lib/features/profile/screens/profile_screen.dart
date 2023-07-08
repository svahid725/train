import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/profile/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderItems(controller: controller),
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
                          Text(
                            'ویرایش ایمیل',
                            textAlign: TextAlign.center,
                            style: bodyBold2Style(AppColors.darkPrimary9),
                          ),
                          szdBoxW16,
                          Container(
                            width: 1,
                            height: 10,
                            color: Colors.black,
                          ),
                          szdBoxW16,
                          Text(
                            'ارسال مجدد ایمیل',
                            textAlign: TextAlign.center,
                            style: bodyBold2Style(AppColors.darkPrimary9),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('۵۳۲',
                              textAlign: TextAlign.center,
                              style: heavyTitleStyle(true)),
                          Text(
                            'دنبال کننده',
                            style: body1Style(color: AppColors.grayBold),
                          )
                        ],
                      ),
                      Container(
                        height: 51,
                        width: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('۴۲۲',
                              textAlign: TextAlign.center,
                              style: heavyTitleStyle(true)),
                          Text(
                            'دنبال شده',
                            style: body1Style(color: AppColors.grayBold),
                          )
                        ],
                      ),
                      Container(
                        height: 51,
                        width: 1,
                        color: Colors.black.withOpacity(0.1),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('جستجو',
                              textAlign: TextAlign.center,
                              style: heavyTitleStyle(true).copyWith(
                                  fontWeight: FontWeight.w800, fontSize: 18)),
                          Text(
                            'دوستان جدید',
                            style: body1Style(color: AppColors.grayBold),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      body2Style(color: Colors.white).copyWith(
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
                  child: Container(
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white10,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/BGroadmap.png'),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'نقشه راه دوره',
                                style: orangeBoldTitleStyle(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '۳ از ۱۰',
                                    style: bodyBold2Style(Colors.black),
                                  ),
                                  Text(
                                    'ایستگاه کامل شده',
                                    style: body2Style(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset('assets/images/roadmap.png'))
                      ],
                    ),
                  ),
                ),
                szdBoxW10,
                Expanded(
                  child: Container(
                    height: 112,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white10,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/BGroadmap.png'),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'لیدربورد',
                                style: orangeBoldTitleStyle(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '۲۳ از ۴۰۰',
                                    style: bodyBold2Style(Colors.black),
                                  ),
                                  Text(
                                    'موقعیت شما',
                                    style: body2Style(color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset('assets/images/roadmap.png'))
                      ],
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
  }
}

class HeaderItems extends StatelessWidget {
  const HeaderItems({
    super.key,
    required this.controller,
  });

  final ProfileController controller;

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
                ],
              ),
            ),
            Positioned(
              top: 65,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(right: 22, left: 26),
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => controller.openDrawer(Get.context!),
                        child: Container(
                          height: 35,
                          width: 35,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/svg/drawer.svg',
                            height: 12,
                            width: 12,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(9),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          'assets/svg/alarm.svg',
                          height: 12,
                          width: 12,
                        ),
                      ),
                    ],
                  ),
                ),
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
