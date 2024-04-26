import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import 'package:widget_mask/widget_mask.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // double height = EDeviceUtils.getScreenHeight();
    // double width = EDeviceUtils.getScreenWidth();
    final PageController controller = PageController();

    return Stack(
      children: [
        /// --- IMAGE --- ///
        Positioned(
          top: 0,
          bottom: 0,
          right: 40,
          child: WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            // mask: AnimateGradient(
            //   duration: const Duration(seconds: 3),
            //   primaryColors: const [
            //     EColors.secondary,
            //     EColors.accent,
            //     EColors.accent,
            //     // EColors.secondary
            //   ],
            //   secondaryColors: const [
            //     EColors.accent,
            //     EColors.accent,
            //     EColors.secondary,
            //     // EColors.accent
            //   ],
            // ),
            mask: Image.asset(
              EImages.studio2,
              fit: BoxFit.cover,
            ),
            child: SvgPicture.asset(
              'assets/images/red_texas.svg',
            ),
          ),
        ),

        /// --- TEXT --- ///
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SizedBox(
            height: height,
            width: width * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.5,
                  width: width * 0.7,
                  child: PageView(
                    controller: controller,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextAnimator(
                            EText.name.toUpperCase(),
                            incomingEffect:
                                WidgetTransitionEffects.incomingScaleDown(),
                            style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                                ? Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: EColors.accent,
                                      fontSize: ESizes.fontSizeHeadline * 2.5,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      color: EColors.accent,
                                      fontSize: ESizes.fontSizeHeadline * 1,
                                    ),
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: EText.homeSubtext,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: ESizes.spaceBtwItems),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: EText.homeSubtext2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 750.ms, curve: Curves.easeIn),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: EText.name.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: EColors.secondary),
                                ),
                                const TextSpan(text: " "),
                                const TextSpan(
                                  text: EText.aboutSubtext1,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: ESizes.spaceBtwItems),

                          /// --- Paragraph Bottom --- ///
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  ),
                              children: [
                                const TextSpan(
                                  text: EText.aboutSubtext2,
                                ),
                                TextSpan(
                                  text: EText.aboutSubtextHighlight1
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: EColors.secondary),
                                ),
                                const TextSpan(
                                  text: " to ",
                                ),
                                TextSpan(
                                  text: EText.aboutSubtextHighlight2
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: EColors.secondary),
                                ),
                                const TextSpan(
                                  text: " AND ",
                                ),
                                TextSpan(
                                  text: EText.aboutSubtextHighlight3
                                      .toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: EColors.secondary),
                                ),
                                const TextSpan(
                                  text: EText.aboutSubtext3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 750.ms, curve: Curves.easeIn),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// --- Image --- ///
                          ECard(
                            borderColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: ColorFiltered(
                                colorFilter: const ColorFilter.mode(
                                  EColors.primary,
                                  BlendMode.saturation,
                                ),
                                child: Image.asset(
                                  EImages.playlistJd,
                                  height: ESizes.circleImageSizeLg * 3,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: ESizes.spaceBtwSections),

                          /// --- Headline --- ///
                          Text(
                            textAlign: TextAlign.center,
                            'Head Engineer'.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: EColors.secondary),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'JxD',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: EColors.accent),
                          ),
                          const SizedBox(height: ESizes.spaceBtwSections),

                          /// --- Bio --- ///
                          Text(
                            textAlign: TextAlign.center,
                            EText.beatSubtext1,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: EColors.secondary,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 750.ms, curve: Curves.easeIn),
                    ],
                  ),
                ),
                const SizedBox(height: ESizes.spaceBtwSections),
                SmoothPageIndicator(
                  onDotClicked: (index) => controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
                  controller: controller,
                  count: 3,
                  // effect: const ExpandingDotsEffect(
                  //     activeDotColor: EColors.accent, dotHeight: 55),
                  effect: CustomizableEffect(
                    activeDotDecoration: DotDecoration(
                      width: 15,
                      height: 36,
                      color: EColors.accent,
                      // rotationAngle: 180,
                      verticalOffset: -10,
                      borderRadius: BorderRadius.circular(24),
                      // dotBorder: DotBorder(
                      //   padding: 2,
                      //   width: 2,
                      //   color: Colors.indigo,
                      // ),
                    ),
                    dotDecoration: DotDecoration(
                      width: 15,
                      height: 15,
                      color: EColors.secondary,
                      // dotBorder: DotBorder(
                      //   padding: 2,
                      //   width: 2,
                      //   color: Colors.grey,
                      // ),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(2),
                      //     topRight: Radius.circular(16),
                      //     bottomLeft: Radius.circular(16),
                      //     bottomRight: Radius.circular(2)),
                      borderRadius: BorderRadius.circular(16),
                      verticalOffset: 0,
                    ),
                    spacing: 6.0,
                    // activeColorOverride: (i) => colors[i],
                    // inActiveColorOverride: (i) => colors[i],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
