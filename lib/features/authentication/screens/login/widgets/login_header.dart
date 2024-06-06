import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ELoginHeader extends StatelessWidget {
  const ELoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = EHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(
          height: ESizes.imageSizeLg,
          image: AssetImage(
              // dark ? EImages.lightAppLogo : EImages.colorSecondaryAppLogo,
              EImages.logoWhite),
        ),
        Text(
          EText.authLoginTitle,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: EColors.secondary),
        ),
        const SizedBox(
          height: ESizes.sm,
        ),
        Text(
          EText.authLoginSubTitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: EColors.secondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
