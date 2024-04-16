// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:lottie/lottie.dart';

// import 'package:red_dot_ent/common/widgets/drawer/widgets/nav_list_tiles.dart';
// import 'package:red_dot_ent/common/widgets/icons/on_hover_icon.dart';
// import 'package:red_dot_ent/common/widgets/fab/floating_action_button.dart';
// import 'package:red_dot_ent/features/home/hero_screen.dart';
// import 'package:red_dot_ent/features/music/player_screen.dart';
// import 'package:red_dot_ent/features/music/producer_screen.dart';
// import 'package:red_dot_ent/features/pricing/pricing_screen.dart';
// import 'package:red_dot_ent/utils/constants/exports.dart';
// import 'package:red_dot_ent/utils/constants/icons.dart';

// import 'package:widget_mask/widget_mask.dart';

// class DesktopLayout extends StatefulWidget {
//   const DesktopLayout({super.key});

//   @override
//   State<DesktopLayout> createState() => _DesktopLayoutState();
// }

// class _DesktopLayoutState extends State<DesktopLayout> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = NavigationController.instance;

//     // final VideoController videoController = Get.put(VideoController());
// //     return Scaffold(
// //       backgroundColor: EColors.primary,
// //       floatingActionButton: const EFloatingActionButton(),
// //       body: NestedScrollView(
// //         // floatHeaderSlivers: true, // To have appbar reappear immediateley
// //         headerSliverBuilder: (context, innerBoxIsScrolled) => [
// //           SliverAppBar(
// //             backgroundColor: Colors.transparent,
// //             elevation: 5,
// //             forceElevated: innerBoxIsScrolled,
// //             // bottom: PreferredSize(
// //             //     preferredSize: const Size.fromHeight(10),
// //             //     child: Container()),
// //             title: Padding(
// //               padding: const EdgeInsets.only(top: 15.0),
// //               child: Image.asset(
// //                 EImages.logo,
// //                 height: 70,
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             floating: true,
// //             snap: true,
// //             centerTitle: true,
// //             expandedHeight: 100,
// //             flexibleSpace: FlexibleSpaceBar(
// //               background: Container(
// //                 decoration: const BoxDecoration(
// //                     gradient: LinearGradient(colors: [
// //                   EColors.accent,

// //                   // Theme.of(context).scaffoldBackgroundColor
// //                   Colors.transparent
// //                 ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
// //               ),
// //             ),

// //             /// --- TabBar --- ///
// //             /// If Using TabBar, wrap Scaffold with DefaultTabController and add length: tab#
// //             /// Also, wrap your body in a TabBarView with children of 'views'
// //             /// https://www.youtube.com/watch?v=xzPXqQ-Pe2g
// //             // pinned: true // Keeps the tabbar sticky
// //             // bottom: TabBar(
// //             //   tabs: [
// //             //     Tab(
// //             //       icon: EIcons.instagram,
// //             //     ),
// //             //     Tab(
// //             //       icon: EIcons.instagram,
// //             //     )
// //             //   ],
// //             // ),
// //           ),
// //         ],

// /// --- Original Code Below --- ///
// ///
// // class DesktopLayout extends StatefulWidget {
// //   const DesktopLayout({super.key});

// //   @override
// //   State<DesktopLayout> createState() => _DesktopLayoutState();
// // }

// // class _DesktopLayoutState extends State<DesktopLayout> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final controller = NavigationController.instance;
// //     return LayoutBuilder(
// //       builder: (context, constraints) {
// //         double height = EDeviceUtils.getScreenHeight();
// //         double width = EDeviceUtils.getScreenWidth();
// //         return Scaffold(
// //           backgroundColor: Theme.of(context).colorScheme.background,
// //           floatingActionButton: const EFloatingActionButton(),
// //           body: Container(
// //             constraints: const BoxConstraints.expand(),
// //             decoration: BoxDecoration(
// //               image: DecorationImage(
// //                 colorFilter: ColorFilter.mode(
// //                     EColors.primary.withOpacity(EStyle.colorBlockOpacity),
// //                     BlendMode.darken),
// //                 image: const AssetImage(EImages.bg),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 /// --- Navigation --- ///
// //                 const Expanded(
// //                   flex: 2,
// //                   child: EDrawer(isRounded: false),
// //                 ),

// //                 /// --- Content --- ///
// //                 Expanded(
// //                   flex: 4,
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.start,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Container(
// //                         color: EColors.tertiary
// //                             .withOpacity(EStyle.colorBlockOpacity),
// //                         height: height,
// //                         width: double.infinity,
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(30.0),
// //                           child: Center(
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.center,
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               children: [
// //                                 Obx(
// //                                   () {
// //                                     switch (controller.currentPage.value) {
// //                                       case 0:
// //                                         return const HomeScreen();
// //                                       case 1:
// //                                         return const AboutScreen2();

// //                                       case 2:
// //                                         return const PricingScreen();
// //                                       case 3:
// //                                         return const PlayerScreen();
// //                                       case 4:
// //                                         return GalleryScreen();
// //                                       case 5:
// //                                         return const ReservationScreen();
// //                                       default:
// //                                         return Container();
// //                                     }
// //                                   },
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const Spacer(
// //                   flex: 3,
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/fab/floating_action_button.dart';
import 'package:red_dot_entertainment/features/home/hero_screen.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:widget_mask/widget_mask.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const EFloatingActionButton(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(EText.home,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: EColors.secondary)),
                          const SizedBox(
                            width: ESizes.spaceBtwSections,
                          ),
                          Text(EText.about,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: EColors.secondary)),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
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
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: HeroScreen(),
          ),
          SliverToBoxAdapter(
            child: WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Image.asset(
                EImages.bg,
                fit: BoxFit.cover,
                height: 300,
              ),
              child: Image.asset(
                'assets/images/soundwave_large.gif',
                height: 300,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Lottie.asset('assets/animations/soundwave.json',
                width: double.infinity, height: 300),
          ),
          SliverToBoxAdapter(
            child: WidgetMask(
              blendMode: BlendMode.srcATop,
              childSaveLayer: true,
              mask: Image.asset(EImages.bg),
              child: Image.asset(
                EImages.logo,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
