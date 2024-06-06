import 'package:red_dot_entertainment/features/authentication/controllers/signup_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ETermsAndConditionsCheckbox extends StatelessWidget {
  const ETermsAndConditionsCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = EHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: ESizes.defaultSpace,
            height: ESizes.defaultSpace,
            child: Obx(() => Checkbox(
                value: controller.privacyPolicy.value,
                onChanged: (value) => controller.privacyPolicy.value =
                    !controller.privacyPolicy.value))),
        const SizedBox(
          width: ESizes.spaceBtwItems,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${EText.authAgreeTo} ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: EColors.textWhite),
              ),
              TextSpan(
                text: EText.authPrivacyPolicy,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? EColors.textWhite : EColors.textWhite,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? EColors.textWhite : EColors.textWhite,
                    ),
              ),
              TextSpan(
                text: ' ${EText.and} ',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: EColors.textWhite),
              ),
              TextSpan(
                text: EText.authTerms,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: dark ? EColors.textWhite : EColors.textWhite,
                      decoration: TextDecoration.underline,
                      decorationColor:
                          dark ? EColors.textWhite : EColors.textWhite,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
