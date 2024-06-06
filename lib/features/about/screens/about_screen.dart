import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/features/about/widgets/about_carousel.dart';
import 'package:red_dot_entertainment/features/about/widgets/glass.dart';
import 'package:red_dot_entertainment/utils/constants/animations.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = EDeviceUtils.getScreenWidth();
    double width = MediaQuery.sizeOf(context).width;
    double height = EDeviceUtils.getScreenHeight() * 0.7;

    final isTablet = width < ESizes.tablet;
    final isMobile = width < ESizes.mobile;

    return Container(
      width: width,
      height: height,
      color: EColors.secondary,
      child: Stack(
        children: [
          /// --- BACKGROUND IMAGE --- ///
          Positioned(
            top: 0,
            bottom: 0,
            right: isMobile ? 0 : width * 0.1,
            left: isMobile ? 0 : null,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AboutBackground(),
                SizedBox(),
              ],
            ),
          ),

          /// --- BOLD TITLE TEXT --- ///

          Positioned(
            top: -(width * 0.04),
            left: 0,
            right: 0,
            child: Text(
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.visible,
              EText.name.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: width * 0.09,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),

          /// --- BODY SECTION --- ///
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// --- TITLE --- ///
              // Text(
              //   EText.name.toUpperCase(),
              //   textAlign: TextAlign.center,
              //   style: isMobile
              //       ? Theme.of(context).textTheme.headlineLarge!.copyWith(
              //             color: EColors.accent,
              //             fontSize: ESizes.fontSizeHeadline * 1.0,
              //           )
              //       : width < ESizes.tablet
              //           ? Theme.of(context).textTheme.headlineLarge!.copyWith(
              //                 color: EColors.accent,
              //                 fontSize: ESizes.fontSizeHeadline * 2,
              //               )
              //           : Theme.of(context).textTheme.headlineLarge!.copyWith(
              //                 color: EColors.accent,
              //                 fontSize: ESizes.fontSizeHeadline * 2.5,
              //               ),
              // ),

              /// --- SUBTITLE --- ///

              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: SizedBox(
                    width: isMobile ? width : width / 2,
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                                ? Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      // color: EColors.secondary,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      // color: EColors.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                            children: <InlineSpan>[
                              const TextSpan(
                                text: EText.aboutLoop1,
                              ),
                              WidgetSpan(
                                child: Wrap(
                                  children: EText.aboutLoopWords
                                      .map((str) => Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: WidgetAnimator(
                                              // atRestEffect:
                                              //     WidgetRestingEffects
                                              //         .wave(),
                                              child: Text(
                                                '$str, ',
                                                style: EDeviceUtils
                                                            .getScreenWidth() >
                                                        ESizes.mobile
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .copyWith(
                                                            // color: EColors.secondary,
                                                            )
                                                    : Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            // color: EColors.secondary,
                                                            ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                              ),
                              const TextSpan(
                                text: EText.aboutLoop2,
                              ),
                            ],
                          ),
                        ),

                        /// --- ABOUT CAROUSEL BUTTON --- ///
                        const SizedBox(height: ESizes.spaceBtwSections),
                        OnHoverAnimatedButton(
                          text: EText.aboutMore,
                          // textColor: EColors.primary,
                          color: EColors.accent,
                          onPressed: () {
                            ELoaders.customDialog(child: const AboutCarousel());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(),
            ],
          ),

          Positioned(
            top: (height / 2) - (height / width) + (height * 0.2),
            child: Lottie.asset(
              EAnimate.sectionDivider,
              width: width,
              repeat: true,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
