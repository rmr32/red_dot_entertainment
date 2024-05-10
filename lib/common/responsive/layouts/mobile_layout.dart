import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hovering/hovering.dart';
import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/common/controllers/scroll_controller.dart';
import 'package:red_dot_entertainment/common/responsive/layouts/tablet_layout.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/drawer/drawer.dart';
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

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final NavigationController navController = Get.find();
    final CustomScrollController scrollController = Get.find();

    return Scaffold(
      floatingActionButton: const EFloatingActionButton(),
      drawer: EDrawer(
        navKey: navController.about,
        // homeKey: homeKey,
        // aboutKey: aboutKey,
        // galleryKey: galleryKey,
        // musicKey: musicKey,
        // storeKey: storeKey,
      ),
      body: CustomScrollView(
        controller: scrollController.scrollController,
        slivers: [
          /// --- SLIVER APPBAR ---///
          SliverAppBar(
            elevation: 0,
            automaticallyImplyLeading: true,
            floating: true,
            snap: true,
            expandedHeight: 75,
            backgroundColor: Colors.transparent,
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
                        /// --- LOGO ---
                        Expanded(
                            flex: 1,
                            child: Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  // Scaffold.of(context).openDrawer();
                                  Scrollable.ensureVisible(
                                    navController.home.currentContext!,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                    alignment: 1.0,
                                  );
                                },
                                child: const Image(
                                  image: AssetImage(
                                    EImages.logoWhite,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              );
                            })),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            key: navController.home,
            child: const HeroScreen(),
          ),
          // SliverToBoxAdapter(
          //   child: SizedBox(height: height, child: const TabletLayout()),
          // ),
          SliverToBoxAdapter(
            key: navController.about,
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
            key: navController.gallery,
            child: GalleryScreen(),
          ),

          // SliverToBoxAdapter(
          //   key: storeKey,
          //   child: const StoreScreen(),
          // ),
          SliverToBoxAdapter(
            key: navController.music,
            child: const MusicScreen(),
          ),
          SliverToBoxAdapter(
            key: navController.contact,
            child: const ContactScreen(),
          ),
        ],
      ),
    );
  }
}
