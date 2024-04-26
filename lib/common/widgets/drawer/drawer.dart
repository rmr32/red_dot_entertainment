import 'package:red_dot_entertainment/common/widgets/drawer/widgets/nav_list_tiles.dart';
import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class EDrawer extends StatelessWidget {
  const EDrawer({super.key, this.isRounded = true});

  final bool isRounded;

  @override
  Widget build(BuildContext context) {
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
              Column(
                children: [
                  const ENavTiles(navPage: EText.home),
                  const ENavTiles(navPage: EText.about),
                  // ENavTiles(navPage: EText.price),
                  const ENavTiles(navPage: EText.beats),
                  const ENavTiles(navPage: EText.gallery),
                  ENavTiles(
                    navPage: EText.book,
                    onPressed: () {
                      // EDeviceUtils.launchUrl(EText.calendly);
                    },
                  ),
                ],
              ),
            ],
          ),

          /// --- Social Icons --- ///
          Padding(
            padding: const EdgeInsets.only(bottom: ESizes.sectionXs),
            child: Column(
              children: [
                Text(
                  EText.follow,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: EColors.secondary),
                ),
                const SizedBox(height: ESizes.spaceBtwItems),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),
                    OnHoverIcon(
                      controllerKey: EText.twitch,
                      icon: EIcons.twitch,
                      onPressed: () {
                        EDeviceUtils.launchUrl(EText.twitchLink);
                      },
                    ),
                    const Spacer(),
                    OnHoverIcon(
                      controllerKey: EText.youtube,
                      icon: EIcons.youtube,
                      onPressed: () {
                        EDeviceUtils.launchUrl(EText.youtubeLink);
                      },
                    ),
                    const Spacer(),
                    OnHoverIcon(
                      controllerKey: EText.instagram,
                      icon: EIcons.instagram,
                      onPressed: () {
                        EDeviceUtils.launchUrl(EText.instagramLink);
                      },
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
