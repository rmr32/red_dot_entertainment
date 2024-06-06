import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ENavBar extends StatelessWidget {
  const ENavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = EDeviceUtils.getScreenWidth();
    final height = EDeviceUtils.getScreenHeight();
    final NavigationController navController = Get.find();
    final CustomScrollController scrollController = Get.find();
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 200),
        top: scrollController.isScrollingDown.value ? 0 : -kToolbarHeight * 3,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  EColors.primary,
                  EColors.primary,
                  EColors.primary.withOpacity(0.5),
                  Colors.transparent,
                ],
                stops: const [
                  0.0,
                  0.3,
                  0.7,
                  0.9,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: height * 0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// --- ABOUT NAVIGATION --- ///
                        HoverButton(
                          onpressed: () {
                            Scrollable.ensureVisible(
                              navController.about.currentContext!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              alignment: 0.5,
                            );
                          },
                          textColor: EColors.secondary,
                          // textColor: scrollController.textColor.value,
                          hoverTextColor: EColors.accent,
                          padding: EdgeInsets.zero,
                          hoverPadding: EdgeInsets.zero,
                          child: const Text(
                            EText.about,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: ESizes.fontSizeHeadline),
                          ),
                        ),

                        const SizedBox(
                          width: ESizes.spaceBtwSections,
                        ),

                        /// --- GALLERY NAVIGATION --- ///
                        HoverButton(
                          onpressed: () {
                            Scrollable.ensureVisible(
                              navController.gallery.currentContext!,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              alignment: 0.5,
                            );
                          },
                          textColor: EColors.secondary,
                          // textColor: navController.currentPage == 1.obs
                          //     ? EColors.secondary
                          //     : EColors.blue,
                          hoverTextColor: EColors.accent,
                          padding: EdgeInsets.zero,
                          hoverPadding: EdgeInsets.zero,
                          child: const Text(
                            EText.gallery,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: ESizes.fontSizeHeadline),
                          ),
                        ),

                        const SizedBox(
                          width: ESizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  ),

                  /// --- LOGO ---
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Scrollable.ensureVisible(
                          navController.home.currentContext!,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                          alignment: 1.0,
                        );
                      },
                      child: Container(
                        // decoration: const BoxDecoration(
                        //   gradient: RadialGradient(
                        //     colors: [
                        //       EColors.secondary,
                        //       Colors.transparent,
                        //     ],
                        //     stops: [
                        //       0.0,
                        //       0.5,
                        //     ],
                        //     center: Alignment.center,
                        //     radius: 1,
                        //     focal: Alignment.center,
                        //     focalRadius: 0.1,
                        //   ),
                        // ),
                        child: const Image(
                          height: 150,
                          image: AssetImage(
                            EImages.logoWhite,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: ESizes.spaceBtwSections,
                          ),

                          /// --- STORE NAVIGATION --- ///
                          // HoverButton(
                          //   onpressed: () {
                          //     Scrollable.ensureVisible(
                          //       storeKey.currentContext!,
                          //       duration:
                          //           const Duration(milliseconds: 500),
                          //       curve: Curves.easeInOut,
                          //       alignment: 0.5,
                          //     );
                          //   },
                          //   textColor: EColors.secondary,
                          //   hoverTextColor: EColors.accent,
                          //   padding: EdgeInsets.zero,
                          //   hoverPadding: EdgeInsets.zero,
                          //   child: const Text(
                          //     EText.store,
                          //     textAlign: TextAlign.center,
                          //     style: TextStyle(
                          //         fontSize: ESizes.fontSizeHeadline),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   width: ESizes.spaceBtwSections,
                          // ),

                          /// --- MUSIC NAVIGATION --- ///
                          HoverButton(
                            onpressed: () {
                              Scrollable.ensureVisible(
                                navController.music.currentContext!,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                alignment: 0.5,
                              );
                            },
                            textColor: EColors.secondary,
                            hoverTextColor: EColors.accent,
                            padding: EdgeInsets.zero,
                            hoverPadding: EdgeInsets.zero,
                            child: const Text(
                              EText.beats,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: ESizes.fontSizeHeadline),
                            ),
                          ),
                          const SizedBox(
                            width: ESizes.spaceBtwSections,
                          ),

                          /// --- CONTACT NAVIGATION --- ///
                          HoverButton(
                            onpressed: () {
                              Scrollable.ensureVisible(
                                navController.contact.currentContext!,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                alignment: 0.5,
                              );
                            },
                            textColor: EColors.secondary,
                            hoverTextColor: EColors.accent,
                            padding: EdgeInsets.zero,
                            hoverPadding: EdgeInsets.zero,
                            child: const Text(
                              EText.contact,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: ESizes.fontSizeHeadline),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
