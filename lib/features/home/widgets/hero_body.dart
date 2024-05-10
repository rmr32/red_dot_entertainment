import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_animated_button.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';

class HeroBody extends StatelessWidget {
  const HeroBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- MAIN HEADLINE --- ///
              // TextAnimator(
              Text(
                EText.homeTagline1.toUpperCase(),
                // incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
                style: width > ESizes.mobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 2.5,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.accent,
                          fontSize: ESizes.fontSizeHeadline * 1,
                        ),
              ),

              Text(
                EText.homeTagline2.toUpperCase(),
                // incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
                style: width > ESizes.mobile
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

              /// --- SUBLINE --- ///
              Text(
                EText.homeTagline3.toUpperCase(),
                style: width > ESizes.mobile
                    ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 1.5,
                        )
                    : Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline * 0.6,
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
                  style: width > ESizes.mobile
                      ? Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: EColors.secondary,
                          )
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
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
                OnHoverAnimatedButton(
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
                  style: width > ESizes.mobile
                      ? Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: EColors.secondary,
                          )
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
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
                OnHoverAnimatedButton(
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
                  style: width > ESizes.mobile
                      ? Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: EColors.secondary,
                          )
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
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
                OnHoverAnimatedButton(
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
    );
  }
}
