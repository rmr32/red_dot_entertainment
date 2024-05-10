import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/common/controllers/scroll_controller.dart';
import 'package:red_dot_entertainment/common/widgets/appbar/appbar.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/drawer/widgets/nav_list_tiles.dart';
import 'package:red_dot_entertainment/common/widgets/fab/floating_action_button.dart';
import 'package:red_dot_entertainment/features/about/about_screen.dart';
import 'package:red_dot_entertainment/features/contact/contact_screen.dart';
import 'package:red_dot_entertainment/features/gallery/gallery_screen.dart';
import 'package:red_dot_entertainment/features/home/hero_screen.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_video.dart';
import 'package:red_dot_entertainment/features/music/music_screen.dart';
import 'package:red_dot_entertainment/features/store/store_screen.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:widget_mask/widget_mask.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final controller = CustomScrollController.instance;

    return ScrollTransformView(
      children: [
        ScrollTransformItem(
          builder: (scrollOffset) {
            final offScreenPercentage = min(scrollOffset / height, 1.0);
            return Image.asset(
              height: height - (height * 0.2 * offScreenPercentage),
              width: width - (width * 0.5 * offScreenPercentage),
              EImages.bg,
              fit: BoxFit.cover,
            );
          },
          offsetBuilder: (scrollOffset) {
            final offScreenPercentage = min(scrollOffset / height, 1.0);
            final heightShrinkageAmount = height * 0.2 * offScreenPercentage;
            final bool startMovingImage = scrollOffset >= height;
            final double onScreenOffset =
                scrollOffset + heightShrinkageAmount / 2;
            return Offset(
              0,
              !startMovingImage
                  ? onScreenOffset
                  : onScreenOffset - (scrollOffset - height * 0.8),
            );
          },
        ),
        ScrollTransformItem(
          builder: (scrollOffset) {
            return SizedBox(
              height: height,
              child: Center(
                child: Text(
                  'yo EVERJOKANMOVMOASDKFO',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: EColors.secondary),
                ),
              ),
            );
          },
          offsetBuilder: (scrollOffset) => Offset(0, -height),
        ),
        ScrollTransformItem(
          builder: (scrollOffset) {
            return Image.asset(
              height: height,
              width: width,
              EImages.studio1,
              fit: BoxFit.cover,
            );
          },
          // offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
        ),
      ],
    );
  }
}
