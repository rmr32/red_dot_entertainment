import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_buttons.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_video.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double height = EDeviceUtils.getScreenHeight();
    // double width = EDeviceUtils.getScreenWidth();

    return Stack(
      children: [
        Container(
          height: height - 200,
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
            height: height - 200,
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
                child: SizedBox(
                  height: height - 220,
                  // child: Transform.scale(scale: 1.2, child: const HeroVideo()),
                ),
              ),
            ),
          ),
        ),

        /// --- TAGLINE --- ///
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAnimator(
                      EText.homeTagline1.toUpperCase(),
                      incomingEffect:
                          WidgetTransitionEffects.incomingScaleDown(),
                      style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                          ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: EColors.accent,
                                fontSize: ESizes.fontSizeHeadline * 2.5,
                              )
                          : Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: EColors.accent,
                                fontSize: ESizes.fontSizeHeadline * 1,
                              ),
                    ),
                    TextAnimator(
                      EText.homeTagline2.toUpperCase(),
                      incomingEffect:
                          WidgetTransitionEffects.incomingScaleDown(),
                      style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                          ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: EColors.accent,
                                fontSize: ESizes.fontSizeHeadline * 2.5,
                              )
                          : Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: EColors.accent,
                                fontSize: ESizes.fontSizeHeadline * 1,
                              ),
                    ),
                    const SizedBox(height: ESizes.spaceBtwItems),
                    Text(
                      EText.homeTagline3.toUpperCase(),
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: EColors.secondary,
                                fontSize: ESizes.fontSizeHeadline * 1.5,
                              ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),

              /// --- PRICING --- ///
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        '1 Hour',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      Text(
                        '\$40',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      EHeroButton(
                        onPressed: () {
                          EDeviceUtils.launchUrl(EText.bookOne);
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        '4 Hours',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      Text(
                        '\$140',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      EHeroButton(
                        onPressed: () {
                          EDeviceUtils.launchUrl(EText.bookFour);
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        '8 Hours',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      Text(
                        '\$240',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: EColors.secondary),
                      ),
                      const SizedBox(height: ESizes.spaceBtwItems / 2),
                      EHeroButton(
                        onPressed: () {
                          EDeviceUtils.launchUrl(EText.bookEight);
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ],
    ).animate().fade(duration: 300.ms);
  }
}
