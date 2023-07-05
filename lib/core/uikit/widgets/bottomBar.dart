/*
class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.controller,
  });

  final MainScreenController? controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (controller) {
        return CurvedNavigationBar(
          index: controller.bottomNavState,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppThemeColors.surfaceColor,
          color: AppThemeColors.botomBarColor,

          items: <Widget>[
            controller.bottomNavState == 0
                ? const SelectedItem(
                    svg: 'message',
                  )
                : const UnselectedItem(svg: 'message', label: 'پیام‌ها'),
            controller.bottomNavState == 1
                ? const SelectedItem(svg: 'play')
                : const UnselectedItem(svg: 'play', label: 'ویدیوها'),
            controller.bottomNavState == 2
                ? const SelectedItem(svg: 'check')
                : const UnselectedItem(svg: 'check', label: 'ارزیابی'),
          ],
          onTap: (index) {
            // controller.bottomNavState = index;
            // controller.update();
            controller.changePage(index);
            // if (controller.bottomNavState == 2 ){
            //   Get.toNamed(AppPages.evaluate.name);
            // }
            // else if ( controller.bottomNavState == 0){
            //   Get.toNamed(AppPages.chat.name);
            // } else{
            //   Get.toNamed(AppPages.mainScreen.name);
            // }
          },
        );
      },
    );
  }
}

class SelectedItem extends StatelessWidget {
  const SelectedItem({
    super.key,
    required this.svg,
  });

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppThemeColors.botomBarActiveIconColor,
          width: 2,
        ),
      ),
      child: SvgPicture.asset(
        'assets/svg/$svg.svg',
        height: 24,
        width: 24,
        colorFilter: const ColorFilter.mode(
          AppThemeColors.botomBarActiveIconColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class UnselectedItem extends StatelessWidget {
  const UnselectedItem({
    super.key,
    required this.svg,
    required this.label,
  });

  final String svg;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/svg/$svg.svg',
          height: 24,
          width: 24,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: onBGStyle(),
        )
      ],
    );
  }
}
*/
