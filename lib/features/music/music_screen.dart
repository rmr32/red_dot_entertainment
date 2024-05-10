// import 'package:flutter_animate/flutter_animate.dart';

// import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
// import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
// import 'package:red_dot_entertainment/features/music/models/controllers/playlist_controller.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';
// import 'package:red_dot_entertainment/utils/device/device_utility.dart';
// import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';

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
    return SizedBox(
      // height: height * 0.8,
      child: Column(
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
                    color: EColors.secondary, fontSize: width * 0.255),
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
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: width * 0.25),
                ),
              ),
            ],
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
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: Column(
              children: [
                /// --- Playlist --- ///
                const Playlist(),

                Image.asset(
                  'assets/images/soundwave_large.gif',
                  repeat: ImageRepeat.repeatX,
                  width: width,
                  height: 50,
                ),

                /// --- Song Player --- ///
                const PlayControls(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
