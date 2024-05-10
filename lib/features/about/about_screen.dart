import 'package:red_dot_entertainment/features/about/widgets/glass.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height *
        (width > ESizes.mobile ? 0.8 : 0.8);

    final PageController controller =
        PageController(viewportFraction: width < ESizes.mobile ? 0.8 : 0.6);

    return Stack(
      children: [
        /// --- BACKGROUND IMAGE --- ///
        Positioned(
          top: 0,
          bottom: 0,
          right: EDeviceUtils.getScreenWidth() > ESizes.mobile ? 40 : 0,
          left: EDeviceUtils.getScreenWidth() > ESizes.mobile ? null : 0,
          child: const AboutBackground(),
        ),

        /// --- NAME TEXT --- ///

        // Positioned(
        //   top: -(width * 0.04),
        //   left: 0,
        //   right: 0,
        //   child: Text(
        //     textAlign: TextAlign.center,
        //     maxLines: 1,
        //     overflow: TextOverflow.visible,
        //     EText.name.toUpperCase(),
        //     style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        //           fontSize: width * 0.09,
        //         ),
        //   ),
        // ),

        /// --- Background Image Logo --- ///
        // Positioned(
        //   top: 0,
        //   left: 0,
        //   right: 0,
        //   child: Opacity(
        //     opacity: 1,
        //     child: WidgetMask(
        //       blendMode: BlendMode.srcATop,
        //       childSaveLayer: true,
        //       mask: Image.asset(
        //         EImages.bg,
        //         fit: BoxFit.cover,
        //       ),
        //       // child: const Text(
        //       //   'ABOUT',
        //       //   style: TextStyle(fontSize: 170),
        //       // ),
        //       child: Image.asset(
        //         EImages.logo,
        //         height: height * 1.2,
        //         fit: BoxFit.contain,
        //       ),
        //     ),
        //   ),
        // ),

        /// --- BODY SECTION --- ///
        Column(
          children: [
            Text(
              EText.name.toUpperCase(),
              textAlign: TextAlign.center,
              style: width < ESizes.mobile
                  ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: EColors.accent,
                        fontSize: ESizes.fontSizeHeadline * 1.5,
                      )
                  : width < ESizes.tablet
                      ? Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: EColors.accent,
                            fontSize: ESizes.fontSizeHeadline * 2,
                          )
                      : Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: EColors.accent,
                            fontSize: ESizes.fontSizeHeadline * 2.5,
                          ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                EText.homeSubtext,
                textAlign: TextAlign.center,
                style: width < ESizes.mobile
                    ? Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: EColors.secondary,
                          // fontSize: ESizes.fontSizeHeadline,
                        )
                    : width < ESizes.tablet
                        ? Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: EColors.secondary,
                              // fontSize: ESizes.fontSizeHeadline * 2,
                            )
                        : Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: EColors.secondary,
                              // fontSize: ESizes.fontSizeHeadline * 2.5,
                            ),
              ),
            ),
            const SizedBox(height: ESizes.spaceBtwSections),

            Padding(
              padding: EdgeInsets.only(
                  left: EDeviceUtils.getScreenWidth() > ESizes.mobile
                      // ? 30.0
                      ? 0.0
                      : 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.8,
                    // width: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    //     ? width * 0.6
                    //     : width * 0.9,

                    /// --- ABOUT PAGES --- ///

                    child: PageView(
                      controller: controller,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: ECardGlass(child: AboutPrimary()),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: ECardGlass(child: AboutSecondary()),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: ECardGlass(child: AboutProducer()),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  /// --- PAGE INDICATOR --- ///
                  AboutPageDots(controller: controller),
                ],
              ),
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       height: height * 0.8,
            //       width: width,

            //       /// --- ABOUT PAGES --- ///

            //       child: PageView(
            //         controller: controller,
            //         children: const [
            //           ECardGlass(child: AboutPrimary()),
            //           ECardGlass(child: AboutSecondary()),
            //           ECardGlass(child: AboutProducer()),
            //         ],
            //       ),
            //     ),
            //     const SizedBox(height: ESizes.spaceBtwSections),

            //     /// --- PAGE INDICATOR --- ///
            //     AboutPageDots(controller: controller),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
