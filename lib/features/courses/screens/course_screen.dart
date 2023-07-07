import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train/common/spaces_and_numbers.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/core/uikit/widgets/course_detail_card.dart';
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
              Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    szdBoxH36,
                    const SearchBar(),
                    szdBoxH32,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LanguageDetailsCard(),
                        LanguageDetailsCard(),
                      ],
                    ),
                    szdBoxH10,
                    Container(
                      height: 52,
                      width: Get.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.borderedCardShadow,
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    szdBoxH32,
                    Row(
                      children: [
                        Text('جدیدترین دوره‌ها',style: heavyTitleStyle().apply(color: AppColors.grayBold),),
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
                    Text('دوره های محبوب',style: heavyTitleStyle().apply(color: AppColors.grayBold),),
                  ],
                ),
              ),
              szdBoxH24,
              const CourseDetailCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDetailsCard extends StatelessWidget {
  const LanguageDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 170,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
          color: const Color(0xEFF7FB80).withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 2),
          gradient: LinearGradient(colors: [
            Colors.white.withOpacity(0.1),
            Colors.white.withOpacity(0.0)
          ]),
          boxShadow: [
            BoxShadow(
                color: AppColors.borderedCardShadow,
                blurRadius: 16,
                offset: const Offset(0, 4))
          ]),
      child: const Column(
        children: [],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: SizedBox(
            height: 38,
            width: 256,
            child: TextField(
              textDirection: TextDirection.rtl,
              style: body1DarkStyle(),
              cursorColor: AppColors.orangeFilterButton,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.grayText,
                ),
                hintText: 'جستجوی دوره‌ها',
                hintStyle: buttonLabelStyle(AppColors.grayText)
                    .copyWith(fontWeight: FontWeight.w400),
                contentPadding: const EdgeInsets.only(top: 4),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.lightGrayInputBorder, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.lightGrayInputBorder, width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
        szdBoxW10,
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(AppColors.orangeFilterButton),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    );
  }
}
