import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';

import 'package:red_dot_entertainment/features/home/widgets/hero_body.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_video.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height *
        (width > ESizes.mobile ? 0.8 : 0.8);

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    EColors.primary,
                    Colors.transparent,
                    EColors.primary
                    // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.2, 0.5, 0.8])),
          // gradient: RadialGradient(
          //   radius: 0.9,
          //   colors: [Colors.transparent, EColors.primary],
          //   ),
          // ),
          // child: Transform.scale(scale: 1.1, child: const HeroVideo()),
          child: Container(
            height: height,
            foregroundDecoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      EColors.primary,
                      Colors.transparent,
                      EColors.primary
                      // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.5, 0.9])),
            child: Center(
              child: ClipRRect(
                  child: Transform.scale(
                scale: width > ESizes.mobile ? 1.5 : 1,
                // child: const HeroVideo(),
                child: const SizedBox(),
              )),
            ),
          ),
        ),

        /// --- TAGLINE --- ///
        const Positioned.fill(
          child: HeroBody(),
        ),
      ],
    ).animate().fade(duration: 300.ms);
  }
}
