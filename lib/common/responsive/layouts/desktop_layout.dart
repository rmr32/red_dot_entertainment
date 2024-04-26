import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/drawer/widgets/nav_list_tiles.dart';
import 'package:red_dot_entertainment/common/widgets/fab/floating_action_button.dart';
import 'package:red_dot_entertainment/features/about/about_screen.dart';
import 'package:red_dot_entertainment/features/contact/contact_screen.dart';
import 'package:red_dot_entertainment/features/gallery/gallery_screen.dart';
import 'package:red_dot_entertainment/features/home/hero_screen.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_video.dart';
import 'package:red_dot_entertainment/features/music/music_screen.dart';
import 'package:red_dot_entertainment/features/store/store_screen.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:widget_mask/widget_mask.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final ScrollController scrollController = ScrollController();
    GlobalKey homeKey = GlobalKey();
    GlobalKey aboutKey = GlobalKey();
    GlobalKey galleryKey = GlobalKey();
    GlobalKey musicKey = GlobalKey();
    GlobalKey storeKey = GlobalKey();

    return Scaffold(
      floatingActionButton: const EFloatingActionButton(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          /// --- SLIVER APPBAR ---///
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 00.0, vertical: 00),
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
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // /// --- HOME NAVIGATION --- ///
                              // HoverButton(
                              //   onpressed: () {
                              //     Scrollable.ensureVisible(
                              //       homeKey.currentContext!,
                              //       duration: const Duration(milliseconds: 500),
                              //       curve: Curves.easeInOut,
                              //       alignment: 1.0,
                              //     );
                              //   },
                              //   textColor: EColors.secondary,
                              //   hoverTextColor: EColors.accent,
                              //   padding: EdgeInsets.zero,
                              //   hoverPadding: EdgeInsets.zero,
                              //   child: const Text(
                              //     EText.home,
                              //     textAlign: TextAlign.center,
                              //     style: TextStyle(
                              //         fontSize: ESizes.fontSizeHeadline),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   width: ESizes.spaceBtwSections,
                              // ),

                              /// --- ABOUT NAVIGATION --- ///
                              HoverButton(
                                onpressed: () {
                                  Scrollable.ensureVisible(
                                    aboutKey.currentContext!,
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
                                  EText.about,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: ESizes.fontSizeHeadline),
                                ),
                              ),
                              const SizedBox(
                                width: ESizes.spaceBtwSections,
                              ),

                              /// --- GALLERY NAVIGATION --- ///
                              HoverButton(
                                onpressed: () {
                                  Scrollable.ensureVisible(
                                    galleryKey.currentContext!,
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
                                  EText.gallery,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: ESizes.fontSizeHeadline),
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
                                homeKey.currentContext!,
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
                                image: AssetImage(
                                  EImages.logoWhite,
                                ),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const SizedBox(
                                  width: ESizes.spaceBtwSections,
                                ),

                                /// --- STORE NAVIGATION --- ///
                                HoverButton(
                                  onpressed: () {
                                    Scrollable.ensureVisible(
                                      storeKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                      alignment: 0.5,
                                    );
                                  },
                                  textColor: EColors.secondary,
                                  hoverTextColor: EColors.accent,
                                  padding: EdgeInsets.zero,
                                  hoverPadding: EdgeInsets.zero,
                                  child: const Text(
                                    EText.store,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: ESizes.fontSizeHeadline),
                                  ),
                                ),
                                const SizedBox(
                                  width: ESizes.spaceBtwSections,
                                ),

                                /// --- MUSIC NAVIGATION --- ///
                                HoverButton(
                                  onpressed: () {
                                    Scrollable.ensureVisible(
                                      musicKey.currentContext!,
                                      duration:
                                          const Duration(milliseconds: 500),
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
                                    style: TextStyle(
                                        fontSize: ESizes.fontSizeHeadline),
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
          ),
          SliverToBoxAdapter(
            key: homeKey,
            child: const HeroScreen(),
          ),
          SliverToBoxAdapter(
            key: aboutKey,
            child: const AboutScreen(),
          ),

          // SliverToBoxAdapter(
          //   child: Lottie.asset('assets/animations/soundwave.json',
          //       width: double.infinity, height: 300),
          // ),
          // SliverToBoxAdapter(
          //   child: Opacity(
          //     opacity: 0.5,
          //     child: WidgetMask(
          //       blendMode: BlendMode.srcATop,
          //       childSaveLayer: true,
          //       mask: Image.asset(
          //         EImages.bg,
          //         fit: BoxFit.cover,
          //       ),
          //       child: Image.asset(
          //         EImages.logo,
          //         height: 600,
          //         fit: BoxFit.contain,
          //       ),
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            key: galleryKey,
            child: GalleryScreen(),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
                height: 400, width: width, child: const ContactScreen()),
          ),
          // SliverToBoxAdapter(
          //   key: storeKey,
          //   child: const StoreScreen(),
          // ),
          SliverToBoxAdapter(
            key: musicKey,
            child: const MusicScreen(),
          ),
        ],
      ),
    );
  }
}
