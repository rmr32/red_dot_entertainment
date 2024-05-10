import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/features/contact/widgets/contact_form.dart';
import 'package:red_dot_entertainment/features/contact/widgets/google_map.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const Divider(
          color: EColors.secondary,
        ),
        const SizedBox(height: ESizes.spaceBtwSections),
        Padding(
          padding: width < ESizes.mobile
              ? const EdgeInsets.symmetric(horizontal: 30.0)
              : const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
          child: SizedBox(
            width: width < ESizes.mobile
                ? width * 0.7
                : width < ESizes.tablet
                    ? width * 0.8
                    : width * 0.5,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: width > ESizes.mobile ? 2 : 1),
              children: [
                const ECard(child: GoogleMapWidget()),
                Column(
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
                            ELoaders.customForm(content: const EContactForm());
                            // ELoaders.showForm(
                            //     isContactForm: true, title: EText.formWorkWithUs);
                          },
                          borderColor: EColors.secondary,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16),
                            child: Text(
                              EText.formContact,
                              textAlign: TextAlign.center,
                              style:
                                  EDeviceUtils.getScreenWidth() > ESizes.mobile
                                      ? Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                            color: EColors.secondary,
                                          )
                                      : Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                            color: EColors.secondary,
                                          ),
                            ),
                          ),
                        ),
                      ),
                      child: ECard(
                        onPressed: () {
                          ELoaders.customForm(
                              content: const EContactForm(
                            title: EText.formContact,
                            subTitle: EText.formContactSubtitle,
                          ));
                          // ELoaders.showForm(
                          //     isContactForm: true, title: EText.formWorkWithUs);
                        },
                        borderColor: EColors.accent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 16),
                          child: Text(
                            EText.formContact,
                            textAlign: TextAlign.center,
                            style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: EColors.secondary,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: EColors.secondary,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // child: width > ESizes.mobile
          //     ? Row(
          //         children: [
          //           const ECard(
          //               child: SizedBox(
          //                   width: 200, height: 200, child: GoogleMapWidget())),
          //           Column(
          //             mainAxisAlignment: width > ESizes.mobile
          //                 ? MainAxisAlignment.center
          //                 : MainAxisAlignment.start,
          //             children: [
          //               width > ESizes.mobile
          //                   ? const SizedBox.shrink()
          //                   : const SizedBox(height: ESizes.spaceBtwItems),
          //               Text(
          //                 EText.addressStreet,
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               Text(
          //                 '${EText.addressCity}, ${EText.addressState} ${EText.addressZip}',
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               Text(
          //                 EText.addressSuite,
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               const SizedBox(height: ESizes.spaceBtwItems),
          //               HoverWidget(
          //                 onHover: (hovering) {
          //                   // print('Widget hovered: $hovering');
          //                 },
          //                 hoverChild: WidgetAnimator(
          //                   atRestEffect: WidgetRestingEffects.wave(),
          //                   child: ECard(
          //                     onPressed: () {
          //                       ELoaders.customForm(
          //                           content: const EContactForm());
          //                       // ELoaders.showForm(
          //                       //     isContactForm: true, title: EText.formWorkWithUs);
          //                     },
          //                     borderColor: EColors.secondary,
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 10.0, horizontal: 16),
          //                       child: Text(
          //                         EText.formContact,
          //                         textAlign: TextAlign.center,
          //                         style: EDeviceUtils.getScreenWidth() >
          //                                 ESizes.mobile
          //                             ? Theme.of(context)
          //                                 .textTheme
          //                                 .titleMedium!
          //                                 .copyWith(
          //                                   color: EColors.secondary,
          //                                 )
          //                             : Theme.of(context)
          //                                 .textTheme
          //                                 .titleSmall!
          //                                 .copyWith(
          //                                   color: EColors.secondary,
          //                                 ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 child: ECard(
          //                   onPressed: () {
          //                     ELoaders.customForm(
          //                         content: const EContactForm(
          //                       title: EText.formContact,
          //                       subTitle: EText.formContactSubtitle,
          //                     ));
          //                     // ELoaders.showForm(
          //                     //     isContactForm: true, title: EText.formWorkWithUs);
          //                   },
          //                   borderColor: EColors.accent,
          //                   child: Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                         vertical: 10.0, horizontal: 16),
          //                     child: Text(
          //                       EText.formContact,
          //                       textAlign: TextAlign.center,
          //                       style: EDeviceUtils.getScreenWidth() >
          //                               ESizes.mobile
          //                           ? Theme.of(context)
          //                               .textTheme
          //                               .titleMedium!
          //                               .copyWith(
          //                                 color: EColors.secondary,
          //                               )
          //                           : Theme.of(context)
          //                               .textTheme
          //                               .titleSmall!
          //                               .copyWith(
          //                                 color: EColors.secondary,
          //                               ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ],
          //       )
          //     : Column(
          //         children: [
          //           ECard(
          //               child: SizedBox(
          //                   width: width * 0.5,
          //                   height: width * 0.5,
          //                   child: const GoogleMapWidget())),
          //           Column(
          //             mainAxisAlignment: width > ESizes.mobile
          //                 ? MainAxisAlignment.center
          //                 : MainAxisAlignment.start,
          //             children: [
          //               width > ESizes.mobile
          //                   ? const SizedBox.shrink()
          //                   : const SizedBox(height: ESizes.spaceBtwItems),
          //               Text(
          //                 EText.addressStreet,
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               Text(
          //                 '${EText.addressCity}, ${EText.addressState} ${EText.addressZip}',
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               Text(
          //                 EText.addressSuite,
          //                 style: width > ESizes.mobile
          //                     ? Theme.of(context).textTheme.bodyLarge!.copyWith(
          //                           color: EColors.secondary,
          //                         )
          //                     : Theme.of(context)
          //                         .textTheme
          //                         .bodyMedium!
          //                         .copyWith(
          //                           color: EColors.secondary,
          //                         ),
          //               ),
          //               const SizedBox(height: ESizes.spaceBtwItems),
          //               HoverWidget(
          //                 onHover: (hovering) {
          //                   // print('Widget hovered: $hovering');
          //                 },
          //                 hoverChild: WidgetAnimator(
          //                   atRestEffect: WidgetRestingEffects.wave(),
          //                   child: ECard(
          //                     onPressed: () {
          //                       ELoaders.customForm(
          //                           content: const EContactForm());
          //                       // ELoaders.showForm(
          //                       //     isContactForm: true, title: EText.formWorkWithUs);
          //                     },
          //                     borderColor: EColors.secondary,
          //                     child: Padding(
          //                       padding: const EdgeInsets.symmetric(
          //                           vertical: 10.0, horizontal: 16),
          //                       child: Text(
          //                         EText.formContact,
          //                         textAlign: TextAlign.center,
          //                         style: EDeviceUtils.getScreenWidth() >
          //                                 ESizes.mobile
          //                             ? Theme.of(context)
          //                                 .textTheme
          //                                 .titleMedium!
          //                                 .copyWith(
          //                                   color: EColors.secondary,
          //                                 )
          //                             : Theme.of(context)
          //                                 .textTheme
          //                                 .titleSmall!
          //                                 .copyWith(
          //                                   color: EColors.secondary,
          //                                 ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 child: ECard(
          //                   onPressed: () {
          //                     ELoaders.customForm(
          //                         content: const EContactForm(
          //                       title: EText.formContact,
          //                       subTitle: EText.formContactSubtitle,
          //                     ));
          //                     // ELoaders.showForm(
          //                     //     isContactForm: true, title: EText.formWorkWithUs);
          //                   },
          //                   borderColor: EColors.accent,
          //                   child: Padding(
          //                     padding: const EdgeInsets.symmetric(
          //                         vertical: 10.0, horizontal: 16),
          //                     child: Text(
          //                       EText.formContact,
          //                       textAlign: TextAlign.center,
          //                       style: EDeviceUtils.getScreenWidth() >
          //                               ESizes.mobile
          //                           ? Theme.of(context)
          //                               .textTheme
          //                               .titleMedium!
          //                               .copyWith(
          //                                 color: EColors.secondary,
          //                               )
          //                           : Theme.of(context)
          //                               .textTheme
          //                               .titleSmall!
          //                               .copyWith(
          //                                 color: EColors.secondary,
          //                               ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //   ],
          // ),
        ),
      ],
    );
  }
}
