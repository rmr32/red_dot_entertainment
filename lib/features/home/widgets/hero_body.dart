import 'package:flutter/material.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class HeroBody extends StatelessWidget {
  const HeroBody({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.sizeOf(context).width;
    double width = EDeviceUtils.getScreenWidth();
    double height = EDeviceUtils.getScreenHeight();
    final isMobile = width < ESizes.mobile;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- MAIN HEADLINE --- ///

              TextAnimator(
                // Text(
                EText.homeTagline1.toUpperCase(),

                style: isMobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 1,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 2.5,
                        ),
              ),

              TextAnimator(
                EText.homeTagline2.toUpperCase(),
                style: isMobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 1,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 2.5,
                        ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),

              /// --- SUBLINE --- ///
              Text(
                EText.homeTagline3.toUpperCase(),
                style: isMobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 0.6,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 1.5,
                        ),
                textAlign: TextAlign.start,
              ),
            ],
          ),

          /// --- PRICING --- ///
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          '1 Hour',
                          textAlign: TextAlign.center,
                          style: width > ESizes.mobile
                              ? Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: EColors.secondary,
                                    // fontSize: ESizes.fontSizeHeadline * 0.6,
                                  ),
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
                        // OnHoverAnimatedButton(
                        //   onPressed: () {
                        //     EDeviceUtils.launchUrl(EText.bookOne);
                        //   },
                        // ),
                      ],
                    ),
                    const VerticalDivider(
                      color: EColors.secondary,
                    ),
                    Column(
                      children: [
                        Text(
                          '4 Hours',
                          textAlign: TextAlign.center,
                          style: width > ESizes.mobile
                              ? Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: EColors.secondary,
                                    // fontSize: ESizes.fontSizeHeadline * 0.6,
                                  ),
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
                        // OnHoverAnimatedButton(
                        //   onPressed: () {
                        //     EDeviceUtils.launchUrl(EText.bookFour);
                        //   },
                        // ),
                      ],
                    ),
                    const VerticalDivider(
                      color: EColors.secondary,
                    ),
                    Column(
                      children: [
                        Text(
                          '8 Hours',
                          textAlign: TextAlign.center,
                          style: width > ESizes.mobile
                              ? Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: EColors.secondary,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: EColors.secondary,
                                    // fontSize: ESizes.fontSizeHeadline * 0.6,
                                  ),
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
                        // OnHoverAnimatedButton(
                        //   onPressed: () {
                        //     EDeviceUtils.launchUrl(EText.bookEight);
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ESizes.spaceBtwItems),
              OnHoverAnimatedButton(
                minWidth: 700,
                onPressed: () {
                  EDeviceUtils.launchUrl(EText.bookEight);
                },
              ),
            ],
          ).animate().fade(duration: 300.ms),

          // OnHoverAnimatedButton(
          //   text: 'Sign-up',
          //   onPressed: () {
          //     Get.to(() => const SignupScreen());
          //   },
          // ),
          // OnHoverAnimatedButton(
          //   text: 'Login',
          //   onPressed: () {
          //     Get.to(() => const LoginScreen());
          //   },
          // ),
        ],
      ),
    );
  }
}
