import 'package:animated_expandable_fab/animated_expandable_fab.dart';

import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/features/contact/widgets/subscribe_form.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class EFloatingActionButton extends StatelessWidget {
  const EFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 100,
      openIcon: WidgetAnimator(
          atRestEffect: WidgetRestingEffects.wave(),
          child: const Icon(
            Icons.add,
            size: 40,
          )),
      closeIcon: WidgetAnimator(
        atRestEffect: WidgetRestingEffects.wave(),
        child: const Icon(
          Icons.close,
          color: Colors.red,
        ),
      ),
      children: [
        /// --- INSTAGRAM--- ///
        ActionButton(
          onPressed: () {
            EDeviceUtils.launchUrl(EText.instagramLink);
          },
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          icon: const OnHoverIcon(
            controllerKey: EText.instagram,
            icon: EIcons.instagram,
          ),
        ),

        /// --- YOUTUBE--- ///
        ActionButton(
          onPressed: () {
            EDeviceUtils.launchUrl(EText.youtubeLink);
          },
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          icon: const OnHoverIcon(
            controllerKey: EText.youtube,
            icon: EIcons.youtube,
          ),
        ),

        /// --- TWITCH --- ///
        // ActionButton(
        //   onPressed: () {
        //     EDeviceUtils.launchUrl(EText.twitchLink);
        //   },
        //   padding: EdgeInsets.zero,
        //   color: Colors.transparent,
        //   icon: const OnHoverIcon(
        //     controllerKey: EText.twitch,
        //     icon: EIcons.twitch,
        //   ),
        // ),

        /// --- NEWSLETTER --- ///
        ActionButton(
          onPressed: () {
            ELoaders.customForm(
                content: ESubscribeForm(
              title: EText.formSubscribe.toUpperCase(),
              subTitle: EText.formSubscribeSubtitle,
            ));
          },
          padding: EdgeInsets.zero,
          color: Colors.transparent,
          icon: const OnHoverIcon(
            controllerKey: EText.newsletter,
            icon: EIcons.newsletter,
          ),
        ),
      ],
    );
  }
}
