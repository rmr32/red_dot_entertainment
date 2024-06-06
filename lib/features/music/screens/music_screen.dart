// import 'package:flutter_animate/flutter_animate.dart';

// import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
// import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
// import 'package:red_dot_entertainment/features/music/models/controllers/playlist_controller.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';
// import 'package:red_dot_entertainment/utils/device/device_utility.dart';
// import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/features/music/controllers/playlist_controller.dart';
import 'package:red_dot_entertainment/features/music/widgets/play_controls.dart';
import 'package:red_dot_entertainment/features/music/widgets/playlist.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:red_dot_entertainment/utils/helpers/helper_functions.dart';
import 'package:widget_mask/widget_mask.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = width < ESizes.mobile;
    bool isTablet = width < ESizes.tablet;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        /// --- Headline --- ///
        // Text(
        //   textAlign: TextAlign.center,
        //   EText.beats.toUpperCase(),
        //   style: Theme.of(context)
        //       .textTheme
        //       .headlineMedium!
        //       .copyWith(color: EColors.secondary),
        // ),

        /// --- MUSIC IMAGE --- ///
        // WidgetMask(
        //   blendMode: BlendMode.srcATop,
        //   childSaveLayer: true,
        //   mask: Image.asset(
        //     EImages.studio1,
        //     fit: BoxFit.cover,
        //   ),
        //   child: Image.asset(
        //     'assets/images/soundwave_large.gif',
        //     width: EDeviceUtils.getScreenWidth() > ESizes.mobile
        //         ? 500
        //         : width * 0.5,
        //   ),
        // ),
        Stack(
          children: [
            Text(
              EText.beats.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: EColors.secondary,
                    fontSize: isMobile
                        ? width * 0.255
                        : isTablet
                            ? width * 0.155
                            : width * 0.135,
                  ),
            ),
            WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.asset(
                  EImages.studio3,
                  fit: BoxFit.cover,
                ),
                child: Image.asset(
                  'assets/images/soundwave_large.gif',
                  repeat: ImageRepeat.repeatX,
                  // width: EDeviceUtils.getScreenWidth() > ESizes.mobile
                  //     ? width * 2
                  //     : width * 0.5,
                ),
              ),
              child: Text(
                EText.beats.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: isMobile
                          ? width * 0.25
                          : isTablet
                              ? width * 0.15
                              : width * 0.13,
                    ),
              ),
            ),
          ],
        ),
        Text(
          EText.beatExclusive.toUpperCase(),
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: EColors.secondary,
                // fontSize: isMobile
                //     ? width * 0.25
                //     : isTablet
                //         ? width * 0.15
                //         : width * 0.13,
                letterSpacing: 10,
              ),
        ),
        // WidgetMask(
        //   blendMode: BlendMode.srcATop,
        //   childSaveLayer: true,
        //   mask: Image.asset(
        //     EImages.studio1,
        //     // width: 10,
        //     fit: BoxFit.cover,
        //   ),
        //   child: WidgetMask(
        //     blendMode: BlendMode.srcATop,
        //     childSaveLayer: true,
        //     mask: Image.asset(
        //       'assets/images/soundwave_large.gif',
        //       width: EDeviceUtils.getScreenWidth() > ESizes.mobile
        //           ? 50
        //           : width * 0.5,
        //     ),
        //     child: const Text(
        //       'BEATS',
        //       style: TextStyle(fontSize: 250, fontWeight: FontWeight.w900),
        //     ),
        //   ),
        // ),
        const SizedBox(height: ESizes.spaceBtwSections),

        /// --- MUSIC SECTION --- ///
        const Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: Column(
            children: [
              /// --- Playlist --- ///
              Playlist(),
              SizedBox(height: ESizes.spaceBtwItems),
              // Image.asset(
              //   'assets/images/soundwave_large.gif',
              //   repeat: ImageRepeat.repeatX,
              //   width: width,
              //   height: 50,
              // ),

              /// --- Song Player --- ///
              PlayControls(),
            ],
          ),
        ),
      ],
    );
  }
}
