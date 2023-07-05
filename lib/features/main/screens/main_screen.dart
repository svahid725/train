import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/borderless_card.dart';
import 'package:train/core/uikit/widgets/button.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/main/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.surfaceColor,
        body: GetBuilder(
          init: controller,
          builder: (controller) {
            return Column(
              children: [
                szdBoxH24,
                MainScreenTopSlider(
                  controller: controller,
                ),
                szdBoxH24,
                BodyWidgets()
              ],
            );
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
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
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
                      controller.onPageChange(value);
                    },
                    itemCount: 5,
                    controller: controller.courseCardsController,
                    itemBuilder: (context, index) {
                      return const TopSliderItem();
                    },
                  ),
                ),
              ),
              /* Positioned(
                top: 0,
                child: Container(
                  width: 63,
                  height: 32,
                  decoration: BoxDecoration(
                      color: AppColors.darkPrimary9,
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),),*/
            ],
          ),
          szdBoxH8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return CustomPageIndicator(
                controller: controller,
                index: index,
                currentValue: controller.currentValue,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class BodyWidgets extends StatelessWidget {
  const BodyWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                          backgroundColor: Color(0xffBFF0DC),
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
          szdBoxH36,
          Text(
            'دوره های جدید و جذاب',
            style: heavyTitleStyle(),
          ),
          szdBoxH24,
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 220,
            width: Get.width,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                return Container(
                  height: 220,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(color: AppColors.borderlessCardShadow, blurRadius: 16)
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
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
        child: /*controller.currentValue < 2 ?*/ Image.asset(
          controller.icons[index],
          fit: BoxFit.cover,
          color: index == 0
              ? AppColors.darkBlue
              : index == controller.currentValue
                  ? AppColors.orange6
                  : Colors.black26,
        ) /*: Container (
        height: 7,
        width: 7,
        decoration: BoxDecoration(
          color: index == 0 ? AppColors.darkBlue :
          index == controller.currentValue ? AppColors.orange6
              : Colors.black26,
          shape: BoxShape.circle
        ),

      )*/
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
                      Container(
                        width: 56,
                        height: 28,
                        padding: const EdgeInsets.only(
                            top: 4, left: 8, right: 4, bottom: 4),
                        decoration: ShapeDecoration(
                          color: Colors.black.withOpacity(0.25),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                'assets/icons/usa.png',
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              'A2',
                              textAlign: TextAlign.center,
                              style: bodyBoldWhite(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'آموزش زبان انگلیسی - سطح A2',
                        style: whiteBoldTitleStyle(),
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
