import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:train/core/uikit/theme/app_themes_color.dart';
import 'package:train/features/main/controllers/main_controller.dart';

import '../../utils/text/textThemes.dart';

class BottomNav extends StatelessWidget {
  BottomNav({Key? key}) : super(key: key);
  final MainController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return Container(
          height: 72,
          width: Get.width-40,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.borderlessCardShadow,
                    blurRadius: 16,
                    offset: const Offset(0, 8))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomNavItem(
                label: 'خانه',
                index: 0,
                imageName: 'home',
                onTap: () {
                  controller.bottomNavIndex = 0;
                  controller.onPageChange(
                    index: 0,
                    controller: controller.mainPageController,
                  );
                },
              ),
              bottomNavItem(
                label: 'دوره‌ها',
                index: 1,
                imageName: 'courses',
                onTap: () {
                  controller.bottomNavIndex = 1;
                  controller.onPageChange(
                    index: 1,
                    controller: controller.mainPageController,
                  );
                },
              ),
              bottomNavItem(
                label: 'پروفایل',
                index: 2,
                imageName: 'profile',
                onTap: () {
                  controller.bottomNavIndex = 2;
                  controller.onPageChange(
                    index: 2,
                    controller: controller.mainPageController,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  GestureDetector bottomNavItem(
      {required String label,
      required void Function() onTap,
      required int index,
      required String imageName}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset('assets/svg/$imageName.svg',
              colorFilter: index == controller.bottomNavIndex
                  ? const ColorFilter.mode(AppColors.orange7, BlendMode.srcIn)
                  : null),
          const SizedBox(height: 4),
          Text(
            label,
            style: body2Style(color:  controller.bottomNavIndex == index ? AppColors.orange7 : AppColors.darkPrimary9).copyWith(
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
