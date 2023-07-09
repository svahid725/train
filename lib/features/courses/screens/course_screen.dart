import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/course_detail_card.dart';
import 'package:train/core/uikit/widgets/search_bar.dart';
import 'package:train/core/utils/text/textThemes.dart';
import 'package:train/features/courses/controllers/course_controller.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({Key? key}) : super(key: key);
  final CourseController controller = Get.put(CourseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.surfaceColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    szdBoxH36,
                    Row(
                      children: [
                         Expanded(
                          child: MySearchBar(
                            hintText: 'جستجوی دوره‌ها',
                            itemColors: AppColors.grayText,
                            borderColor: AppColors.lightGrayInputBorder,
                            controller: controller.searchController,
                          ),
                        ),
                        szdBoxW10,
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.orangeFilterButton),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/filter.png',
                                height: 14,
                                width: 14,
                              ),
                              szdBoxW10,
                              Text(
                                'فیلتر',
                                style: bodyBold1Style(Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    szdBoxH32,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LanguageDetailsCard(
                          imageName: 'France',
                          title: 'فرانسوی',
                          students: '۲,۶۴۲',
                          courses: '8',
                        ),
                        LanguageDetailsCard(
                          imageName: 'usa',
                          title: 'انگلیسی',
                          students: '۶۴۲',
                          courses: '6',
                        ),
                      ],
                    ),
                    szdBoxH10,
                    const SeeAllCourses(),
                    szdBoxH32,
                    Row(
                      children: [
                        Text(
                          'جدیدترین دوره‌ها',
                          style: heavyTitleStyle(true),
                        ),
                      ],
                    ),
                    szdBoxH24,
                  ],
                ),
              ),
              const CourseDetailCard(),
              szdBoxH32,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'دوره های محبوب',
                      style: heavyTitleStyle(true),
                    ),
                  ],
                ),
              ),
              szdBoxH24,
              const CourseDetailCard(),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SeeAllCourses extends StatelessWidget {
  const SeeAllCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: Get.width - 40,
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      decoration: BoxDecoration(
        color: const Color(0x7FEFF7FB),
        borderRadius: BorderRadius.circular(8),
        border: GradientBoxBorder(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white.withOpacity(0.0)])),
        boxShadow: [
          BoxShadow(
            color: AppColors.borderedCardShadow,
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  right: 0,
                  child: Image.asset(
                    'assets/icons/Spain.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Positioned(
                  right: 4,
                  child: Image.asset(
                    'assets/icons/German.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Positioned(
                  right: 12,
                  child: Image.asset(
                    'assets/icons/Italy.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 28,
          ),
          Text(
            'مشاهده تمام زبان‌ها',
            style: bodyBold1Style(Colors.black),
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 12,
          )
        ],
      ),
    );
  }
}

class LanguageDetailsCard extends StatelessWidget {
  const LanguageDetailsCard({
    super.key,
    required this.imageName,
    required this.title,
    required this.students,
    required this.courses,
  });

  final String imageName;
  final String title;
  final String students;
  final String courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 170,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
          color: const Color(0x7FEFF7FB),
          borderRadius: BorderRadius.circular(8),
          border: GradientBoxBorder(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
            ),
          ),
          boxShadow: [
            BoxShadow(
                color: AppColors.borderedCardShadow,
                blurRadius: 16,
                offset: const Offset(0, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            'assets/icons/${imageName}48.png',
            height: 48,
            width: 48,
          )),
          szdBoxH8,
          Text(
            title,
            style: heavyTitleStyle(false),
          ),
          szdBoxH24,
          Row(
            children: [
              Image.asset(
                'assets/icons/profile.png',
                width: 12,
                height: 12,
                color: AppColors.black,
              ),
              szdBoxW8,
              Row(
                children: [
                  Text(
                    '${students} ',
                    style: bodyBold1Style(AppColors.darkPrimary9),
                  ),
                  Text(
                    'زبان آموز',
                    style: body2Style(color: AppColors.darkPrimary9),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/icons/courses.png',
                width: 12,
                height: 12,
                color: AppColors.black,
              ),
              szdBoxW8,
              Row(
                children: [
                  Text(
                    '${courses} ',
                    style: bodyBold1Style(AppColors.darkPrimary9),
                  ),
                  Text(
                    'زبان آموز',
                    style: body2Style(color: AppColors.darkPrimary9),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


