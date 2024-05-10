import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ENavTiles extends StatelessWidget {
  const ENavTiles({super.key, required this.navPage, this.onPressed});

  final String navPage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();

    // return Obx(
    //   () => ListTile(
    //     // leading: const Icon(
    //     //   EImages.iconHome,
    //     //   color: EColors.secondary,
    //     // ),
    //     hoverColor: EColors.accent.withOpacity(EStyle.colorBlockOpacity),
    //     contentPadding: const EdgeInsets.symmetric(
    //         horizontal: ESizes.xl, vertical: ESizes.sm),
    //     title: Text(navPage),
    //     textColor: EColors.secondary,
    //     // selected: controller.currentPage.value == EMaps.navPage[navPage],
    //     // selectedColor: EColors.accent,
    //     onTap: onPressed ??
    //         () {
    //           controller.changePage(EMaps.navPage[navPage]!);
    //           controller.scrollPage(EMaps.navPage[navPage]!);
    //           // Scrollable.ensureVisible(
    //           //   controller.about.currentContext!,
    //           //   duration: const Duration(milliseconds: 500),
    //           //   curve: Curves.easeInOut,
    //           //   alignment: 0.5,
    //           // );
    //           Get.back();
    //           // Get.toNamed(ERoutes.home);
    //         },
    //   ),
    // );
    return ListTile(
      // leading: const Icon(
      //   EImages.iconHome,
      //   color: EColors.secondary,
      // ),
      hoverColor: EColors.accent.withOpacity(EStyle.colorBlockOpacity),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: ESizes.xl, vertical: ESizes.sm),
      title: Text(navPage),
      textColor: EColors.secondary,
      // selected: controller.currentPage.value == EMaps.navPage[navPage],
      // selectedColor: EColors.accent,
      onTap: onPressed ??
          () {
            // controller.changePage(EMaps.navPage[navPage]!);
            controller.scrollPage(EMaps.navPage[navPage]!);
            // Scrollable.ensureVisible(
            //   controller.about.currentContext!,
            //   duration: const Duration(milliseconds: 500),
            //   curve: Curves.easeInOut,
            //   alignment: 0.5,
            // );
            Get.back();
            // Get.toNamed(ERoutes.home);
          },
    );
  }
}
