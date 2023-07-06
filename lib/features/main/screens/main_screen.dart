import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/borderless_card.dart';
import 'package:train/core/uikit/widgets/bottom_nav.dart';
import 'package:train/core/uikit/widgets/button.dart';
import 'package:train/core/uikit/widgets/course_chip.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/courses/screens/course_screen.dart';
import 'package:train/features/main/controllers/main_controller.dart';
import 'package:train/features/profile/screens/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BottomNav(),
        backgroundColor: AppColors.surfaceColor,
        body: GetBuilder(
          init: controller,
          builder: (controller) {
            return PageView(
                controller: controller.mainPageController,
                children: [
                  Column(
                    children: [
                      szdBoxH24,
                      MainScreenTopSlider(controller: controller),
                      szdBoxH24,
                      const BodyWidgets()
                    ],
                  ),
                  ProfileScreen(),
                  CourseScreen()
                ]);
          },
        ),
      ),
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
                    return const TopSliderItem();
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BorderlessCard(
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
                      style: body1DarkStyle(),
                    ),
                    Text(
                      'زمان صرف‌شده آموزش',
                      style: bodyBold2Style(AppColors.darkPrimary9),
                    )
                  ],
                ),
              ),
              BorderlessCard(
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
                    )
                  ],
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
            style: heavyTitleStyle(),
          ),
        ),
        szdBoxH24,
        Container(
          height: 220,
          width: Get.width,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  left: index == 2 ? 20 : 10,
                  right: index == 0 ? 20 : 0,
                ),
                height: 220,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.borderlessCardShadow, blurRadius: 16)
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 64,
                      child: Image.asset('assets/images/Kremlin.png'),
                    ),
                    Container(
                      height: 64,
                      child: SvgPicture.asset('assets/svg/KremlinBG.svg'),
                    ),
                    const Positioned(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CourseChip(country: 'Russia', label: 'A2'),
                            CourseChip(country: 'star', label: '4.5'),
                          ],
                        ),
                      ),
                    ),
                    Positioned(top: -15,
                      left: 100,
                        right: 100,
                        child: Image.asset('assets/images/user.png'),),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const SizedBox(
                            height: 104,
                          ),
                          Text(
                            'آموزش زبان روسی - سطح A2',
                            style: boldTitleStyle(false),
                          ),
                          szdBoxH8,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'مدرس: ',
                                style: lightStyle(),
                              ),
                              Text(
                                'محمدحسین حیدرزاده',
                                style: bodyBold2Style(AppColors.darkPrimary9)
                                    .copyWith(height: 1.8),
                              ),
                            ],
                          ),
                          szdBoxH12,
                          Divider(
                            color: Colors.black.withOpacity(0.05),
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    color: AppColors.darkPrimary6,
                                    size: 16,
                                  ),
                                  szdBoxW8,
                                  Text(
                                    '۲۳ ساعت آموزش',
                                    style: body2DarkStyle().copyWith(
                                        color: AppColors.darkPrimary4,
                                        height: 1.8),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    color: AppColors.darkPrimary6,
                                    size: 16,
                                  ),
                                  szdBoxW8,
                                  Text(
                                    '۱,۲۰۰,۰۰۰ تومان',
                                    style: body2DarkStyle().copyWith(
                                        color: AppColors.darkPrimary4,
                                        decoration: TextDecoration.lineThrough,
                                        height: 1.8),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    'رایگان!',
                                    style: bodyBold2Style(AppColors.mainGreen)
                                        .copyWith(height: 1.8),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  Row(
                    children: [
                      CourseChip(
                        label: 'A2',
                        country: 'usa',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'آموزش زبان انگلیسی - سطح A2',
                        style: boldTitleStyle(true),
                      ),
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
}
