import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/common/widgets/drawer/widgets/nav_list_tiles.dart';
import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class EDrawer extends StatelessWidget {
  const EDrawer({super.key, this.isRounded = true, required this.navKey});

  final bool isRounded;
  final GlobalKey navKey;

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    return Drawer(
      backgroundColor: EColors.primary.withOpacity(EStyle.colorBlockOpacity),
      shape: isRounded
          ? null
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  bottomRight: Radius.circular(0)),
            ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              /// --- Title --- ///
              DrawerHeader(
                // padding: EdgeInsets.zero,
                child: Text(
                  textAlign: TextAlign.center,
                  EText.name.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
              ),

              /// --- Navigation --- ///
              const Column(
                children: [
                  ENavTiles(navPage: EText.home),
                  ENavTiles(navPage: EText.about),
                  ENavTiles(
                    navPage: EText.gallery,
                  ),
                  // ENavTiles(navPage: EText.price),
                  ENavTiles(navPage: EText.beats),

                  // ENavTiles(
                  //   navPage: EText.book,
                  //   onPressed: () {
                  //     // EDeviceUtils.launchUrl(EText.calendly);
                  //   },
                  // ),
                  ENavTiles(navPage: EText.contact),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
