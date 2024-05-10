import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutSecondary extends StatelessWidget {
  const AboutSecondary({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: EColors.secondary,
                        )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: EColors.secondary,
                        ),
                children: <TextSpan>[
                  TextSpan(
                    text: EText.name.toUpperCase(),
                    style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            ),
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
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: EColors.secondary,
                        )
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: EColors.secondary,
                        ),
                children: [
                  const TextSpan(
                    text: EText.aboutSubtext2,
                  ),
                  TextSpan(
                    text: EText.aboutSubtextHighlight1.toUpperCase(),
                    style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            ),
                  ),
                  const TextSpan(
                    text: " to ",
                  ),
                  TextSpan(
                    text: EText.aboutSubtextHighlight2.toUpperCase(),
                    style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            ),
                  ),
                  const TextSpan(
                    text: " AND ",
                  ),
                  TextSpan(
                    text: EText.aboutSubtextHighlight3.toUpperCase(),
                    style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: EColors.secondary,
                            ),
                  ),
                  const TextSpan(
                    text: EText.aboutSubtext3,
                  ),
                ],
              ),
            ),
          ],
        ).animate().fadeIn(duration: 750.ms, curve: Curves.easeIn),
      ),
    );
  }
}
