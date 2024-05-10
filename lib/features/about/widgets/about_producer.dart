import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutProducer extends StatelessWidget {
  const AboutProducer({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 150;
    double width = MediaQuery.of(context).size.width;
    return Column(
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
          style: width > ESizes.mobile
              ? Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: EColors.secondary,
                  )
              : Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: EColors.secondary,
                  ),
          // style: Theme.of(context)
          //     .textTheme
          //     .headlineMedium!
          //     .copyWith(color: EColors.secondary),
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
        width > ESizes.mobile
            ? SizedBox(
                height: height * 0.35,
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.center,
                    EText.beatSubtext1,
                    style: width > ESizes.mobile
                        ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: EColors.secondary,
                            ),
                  ),
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    textAlign: TextAlign.center,
                    EText.beatSubtext1,
                    style: width > ESizes.mobile
                        ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: EColors.secondary,
                            )
                        : Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: EColors.secondary,
                            ),
                  ),
                ),
              ),
      ],
    ).animate().fadeIn(duration: 750.ms, curve: Curves.easeIn);
  }
}
