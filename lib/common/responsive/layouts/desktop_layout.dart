import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    bool isMobile = width < ESizes.mobile;

    final NavigationController navController = Get.find();
    final CustomScrollController scrollController = Get.find();
    return Scaffold(
      floatingActionButton: const EFloatingActionButton(),
      body: Stack(
        children: [
          ScrollTransformView(
            children: [
              /// --- HERO BACKGROUND --- ///
              ScrollTransformItem(
                key: navController.home,
                builder: (scrollOffset) {
                  scrollController.updateScroll(scrollOffset);
                  final offScreenPercentage = min(scrollOffset / height, 1.0);

                  return Container(
                    height: height - (height * 0.2 * offScreenPercentage),
                    width: width - (width * 0.5 * offScreenPercentage),
                    color: EColors.primary,
                    foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              EColors.primary,
                              Colors.transparent,
                              EColors.primary
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 0.5, 1])),
                    child: ClipRRect(
                      child: Transform.scale(
                        scale: isMobile ? 1 : 1.5,
                        child: const HeroVideo(),
                      ),
                    ),
                  );
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage = min(scrollOffset / height, 1.0);
                  final heightShrinkageAmount =
                      height * 0.2 * offScreenPercentage;
                  // -- When to start moving the image
                  final bool startMovingImage = scrollOffset >= height * 0.8;
                  final double onScreenOffset =
                      scrollOffset + heightShrinkageAmount / 2;
                  // -- Holds this Section until we want it to scroll up
                  return Offset(
                    0,
                    !startMovingImage
                        ? onScreenOffset
                        : onScreenOffset - (scrollOffset - height * 0.8),
                  );
                },
              ),

              /// --- HERO FOREGROUND --- ///
              ScrollTransformItem(
                builder: (scrollOffset) {
                  return SizedBox(
                    height: height,
                    width: width,
                    child: const HeroBody(),
                  );
                },
                // -- Moves this Section up on top of the Hero Video
                offsetBuilder: (scrollOffset) => Offset(0, -height),
              ),

              /// --- ABOUT SECTION --- ///
              ScrollTransformItem(
                key: navController.about,
                builder: (scrollOffset) {
                  return const AboutScreen();
                },
                // offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
              ),

              /// --- GALLERY SECTION --- ///
              ScrollTransformItem(
                key: navController.gallery,
                builder: (scrollOffset) {
                  return GalleryScreen();
                },
                // offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
              ),

              /// --- MUSIC SECTION --- ///
              ScrollTransformItem(
                key: navController.music,
                builder: (scrollOffset) {
                  return const MusicScreen();
                },
                // offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
              ),

              /// --- CONTACT SECTION --- ///
              ScrollTransformItem(
                key: navController.contact,
                builder: (scrollOffset) {
                  return const ContactScreen();
                },
                // offsetBuilder: (scrollOffset) => Offset(0, scrollOffset),
              ),
            ],
          ),
          const ENavBar(),
        ],
      ),
    );
  }
}

/// --- USING SLIVERS --- ///
//     return Scaffold(
//       floatingActionButton: const EFloatingActionButton(),
//       body: CustomScrollView(
//         controller: scrollController.scrollController,
//         slivers: [
//           /// --- SLIVER APPBAR ---///
//           SliverAppBar(
//             floating: true,
//             snap: true,
//             expandedHeight: 100,
//             flexibleSpace: FlexibleSpaceBar(
//               collapseMode: CollapseMode.parallax,
//               background: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 00.0, vertical: 00),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [
//                         EColors.primary,
//                         EColors.primary,
//                         EColors.primary.withOpacity(0.5),
//                         Colors.transparent,
//                       ],
//                       stops: const [
//                         0.0,
//                         0.3,
//                         0.7,
//                         0.9,
//                       ],
//                     ),
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.1),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 3,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               /// --- ABOUT NAVIGATION --- ///
//                               HoverButton(
//                                 onpressed: () {
//                                   Scrollable.ensureVisible(
//                                     navController.about.currentContext!,
//                                     duration: const Duration(milliseconds: 500),
//                                     curve: Curves.easeInOut,
//                                     alignment: 0.5,
//                                   );
//                                 },
//                                 textColor: EColors.secondary,
//                                 // textColor: scrollController.textColor.value,
//                                 hoverTextColor: EColors.accent,
//                                 padding: EdgeInsets.zero,
//                                 hoverPadding: EdgeInsets.zero,
//                                 child: const Text(
//                                   EText.about,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: ESizes.fontSizeHeadline),
//                                 ),
//                               ),

//                               const SizedBox(
//                                 width: ESizes.spaceBtwSections,
//                               ),

//                               /// --- GALLERY NAVIGATION --- ///
//                               HoverButton(
//                                 onpressed: () {
//                                   Scrollable.ensureVisible(
//                                     navController.gallery.currentContext!,
//                                     duration: const Duration(milliseconds: 500),
//                                     curve: Curves.easeInOut,
//                                     alignment: 0.5,
//                                   );
//                                 },
//                                 textColor: EColors.secondary,
//                                 // textColor: navController.currentPage == 1.obs
//                                 //     ? EColors.secondary
//                                 //     : EColors.blue,
//                                 hoverTextColor: EColors.accent,
//                                 padding: EdgeInsets.zero,
//                                 hoverPadding: EdgeInsets.zero,
//                                 child: const Text(
//                                   EText.gallery,
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: ESizes.fontSizeHeadline),
//                                 ),
//                               ),

//                               const SizedBox(
//                                 width: ESizes.spaceBtwSections,
//                               ),
//                             ],
//                           ),
//                         ),

//                         /// --- LOGO ---
//                         Expanded(
//                           flex: 1,
//                           child: GestureDetector(
//                             onTap: () {
//                               Scrollable.ensureVisible(
//                                 navController.home.currentContext!,
//                                 duration: const Duration(milliseconds: 500),
//                                 curve: Curves.easeInOut,
//                                 alignment: 1.0,
//                               );
//                             },
//                             child: Container(
//                               // decoration: const BoxDecoration(
//                               //   gradient: RadialGradient(
//                               //     colors: [
//                               //       EColors.secondary,
//                               //       Colors.transparent,
//                               //     ],
//                               //     stops: [
//                               //       0.0,
//                               //       0.5,
//                               //     ],
//                               //     center: Alignment.center,
//                               //     radius: 1,
//                               //     focal: Alignment.center,
//                               //     focalRadius: 0.1,
//                               //   ),
//                               // ),
//                               child: const Image(
//                                 image: AssetImage(
//                                   EImages.logoWhite,
//                                 ),
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                             flex: 3,
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 const SizedBox(
//                                   width: ESizes.spaceBtwSections,
//                                 ),

//                                 /// --- STORE NAVIGATION --- ///
//                                 // HoverButton(
//                                 //   onpressed: () {
//                                 //     Scrollable.ensureVisible(
//                                 //       storeKey.currentContext!,
//                                 //       duration:
//                                 //           const Duration(milliseconds: 500),
//                                 //       curve: Curves.easeInOut,
//                                 //       alignment: 0.5,
//                                 //     );
//                                 //   },
//                                 //   textColor: EColors.secondary,
//                                 //   hoverTextColor: EColors.accent,
//                                 //   padding: EdgeInsets.zero,
//                                 //   hoverPadding: EdgeInsets.zero,
//                                 //   child: const Text(
//                                 //     EText.store,
//                                 //     textAlign: TextAlign.center,
//                                 //     style: TextStyle(
//                                 //         fontSize: ESizes.fontSizeHeadline),
//                                 //   ),
//                                 // ),
//                                 // const SizedBox(
//                                 //   width: ESizes.spaceBtwSections,
//                                 // ),

//                                 /// --- MUSIC NAVIGATION --- ///
//                                 HoverButton(
//                                   onpressed: () {
//                                     Scrollable.ensureVisible(
//                                       navController.music.currentContext!,
//                                       duration:
//                                           const Duration(milliseconds: 500),
//                                       curve: Curves.easeInOut,
//                                       alignment: 0.5,
//                                     );
//                                   },
//                                   textColor: EColors.secondary,
//                                   hoverTextColor: EColors.accent,
//                                   padding: EdgeInsets.zero,
//                                   hoverPadding: EdgeInsets.zero,
//                                   child: const Text(
//                                     EText.beats,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontSize: ESizes.fontSizeHeadline),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   width: ESizes.spaceBtwSections,
//                                 ),

//                                 /// --- CONTACT NAVIGATION --- ///
//                                 HoverButton(
//                                   onpressed: () {
//                                     Scrollable.ensureVisible(
//                                       navController.contact.currentContext!,
//                                       duration:
//                                           const Duration(milliseconds: 500),
//                                       curve: Curves.easeInOut,
//                                       alignment: 0.5,
//                                     );
//                                   },
//                                   textColor: EColors.secondary,
//                                   hoverTextColor: EColors.accent,
//                                   padding: EdgeInsets.zero,
//                                   hoverPadding: EdgeInsets.zero,
//                                   child: const Text(
//                                     EText.contact,
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(
//                                         fontSize: ESizes.fontSizeHeadline),
//                                   ),
//                                 ),
//                               ],
//                             ))
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           SliverToBoxAdapter(
//             // key: homeKey,
//             key: navController.home,
//             child: const HeroScreen(),
//           ),
//           // const SliverToBoxAdapter(
//           //   // key: homeKey,
//           //   // key: navController.home,
//           //   child: TabletLayout(),
//           // ),

//           SliverToBoxAdapter(
//             // key: aboutKey,
//             key: navController.about,
//             child: const AboutScreen(),
//           ),

//           // SliverToBoxAdapter(
//           //   child: Lottie.asset('assets/animations/soundwave.json',
//           //       width: double.infinity, height: 300),
//           // ),
//           // SliverToBoxAdapter(
//           //   child: Opacity(
//           //     opacity: 0.5,
//           //     child: WidgetMask(
//           //       blendMode: BlendMode.srcATop,
//           //       childSaveLayer: true,
//           //       mask: Image.asset(
//           //         EImages.bg,
//           //         fit: BoxFit.cover,
//           //       ),
//           //       child: Image.asset(
//           //         EImages.logo,
//           //         height: 600,
//           //         fit: BoxFit.contain,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           SliverToBoxAdapter(
//             // key: galleryKey,
//             key: navController.gallery,
//             child: GalleryScreen(),
//           ),

//           // SliverToBoxAdapter(
//           //   key: storeKey,
//           //   child: const StoreScreen(),
//           // ),
//           SliverToBoxAdapter(
//             // key: musicKey,
//             key: navController.music,
//             child: const MusicScreen(),
//           ),
//           SliverToBoxAdapter(
//             // key: contactKey,

//             key: navController.contact,
//             child: const ContactScreen(),
//           ),
//         ],
//       ),
//     );
//   }
// }
