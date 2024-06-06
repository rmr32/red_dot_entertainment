import 'package:red_dot_entertainment/features/contact/widgets/contact_form.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: width > ESizes.mobile
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        width > ESizes.mobile
            ? const SizedBox.shrink()
            : const SizedBox(height: ESizes.spaceBtwItems),
        Text(
          EText.addressStreet,
          style: width > ESizes.mobile
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: EColors.secondary,
                  )
              : Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: EColors.secondary,
                  ),
        ),
        Text(
          '${EText.addressCity}, ${EText.addressState} ${EText.addressZip}',
          style: width > ESizes.mobile
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: EColors.secondary,
                  )
              : Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: EColors.secondary,
                  ),
        ),
        Text(
          EText.addressSuite,
          style: width > ESizes.mobile
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: EColors.secondary,
                  )
              : Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: EColors.secondary,
                  ),
        ),
        const SizedBox(height: ESizes.spaceBtwItems),
        HoverWidget(
          onHover: (hovering) {
            // print('Widget hovered: $hovering');
          },
          hoverChild: WidgetAnimator(
            atRestEffect: WidgetRestingEffects.wave(),
            child: ECard(
              onPressed: () {
                ELoaders.customDialog(
                    child: const EContactForm(
                  title: EText.formContact,
                  subTitle: EText.formContactSubtitle,
                ));
                // ELoaders.showForm(
                //     isContactForm: true, title: EText.formWorkWithUs);
              },
              borderColor: EColors.secondary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                child: Text(
                  EText.formContact,
                  textAlign: TextAlign.center,
                  style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                      ? Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: EColors.secondary,
                          )
                      : Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: EColors.secondary,
                          ),
                ),
              ),
            ),
          ),
          child: ECard(
            onPressed: () {
              ELoaders.customDialog(
                  child: const EContactForm(
                title: EText.formContact,
                subTitle: EText.formContactSubtitle,
              ));
              // ELoaders.showForm(
              //     isContactForm: true, title: EText.formWorkWithUs);
            },
            borderColor: EColors.accent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Text(
                EText.formContact,
                textAlign: TextAlign.center,
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: EColors.secondary,
                        )
                    : Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: EColors.secondary,
                        ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
