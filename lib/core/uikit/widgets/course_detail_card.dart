import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/course_chip.dart';
import 'package:train/core/utils/text/textThemes.dart';

class CourseDetailCard extends StatelessWidget {
  const CourseDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: Get.width,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
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
                BoxShadow(color: AppColors.borderlessCardShadow, blurRadius: 16)
              ],
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 64,
                  child: Image.asset('assets/images/Kremlin.png'),
                ),
                SizedBox(
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
                Positioned(
                  top: -15,
                  left: 100,
                  right: 100,
                  child: Image.asset('assets/images/user.png'),
                ),
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
                                    color: AppColors.darkPrimary4, height: 1.8),
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
    );
  }
}
