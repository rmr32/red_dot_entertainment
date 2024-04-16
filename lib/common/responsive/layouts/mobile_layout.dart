import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final controller = NavigationController.instance;
  @override
  Widget build(BuildContext context) {
    double height = EDeviceUtils.getScreenHeight();
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            // floatHeaderSlivers: true, // To have appbar reappear immediateley
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 5,
                    forceElevated: innerBoxIsScrolled,
                    title: const Text(EText.name),
                    floating: true,
                    snap: true,
                    centerTitle: true,
                    expandedHeight: 300,
                    stretch: true,
                    flexibleSpace: const FlexibleSpaceBar(
                      stretchModes: [StretchMode.blurBackground],
                      background: Image(
                        image: AssetImage(EImages.austin1),
                        fit: BoxFit.cover,
                      ),
                    ),

                    /// --- TabBar --- ///
                    /// If Using TabBar, wrap Scaffold with DefaultTabController and add length: tab#
                    /// Also, wrap your body in a TabBarView with children of 'views'
                    /// https://www.youtube.com/watch?v=xzPXqQ-Pe2g
                    // pinned: true // Keeps the tabbar sticky
                    // bottom: TabBar(
                    //   tabs: [
                    //     Tab(
                    //       icon: EIcons.instagram,
                    //     ),
                    //     Tab(
                    //       icon: EIcons.instagram,
                    //     )
                    //   ],
                    // ),
                  ),
                ],
            body: ListView.separated(
                itemBuilder: ((context, index) => Text(index.toString())),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                itemCount: 50)),
      ),
    );
  }
}

// class MobileLayout extends StatefulWidget {
//   const MobileLayout({super.key});

//   @override
//   State<MobileLayout> createState() => _MobileLayoutState();
// }

// class _MobileLayoutState extends State<MobileLayout> {
//   final controller = NavigationController.instance;
//   @override
//   Widget build(BuildContext context) {
//     double height = EDeviceUtils.getScreenHeight();
//     return SafeArea(
//       child: Scaffold(
//         extendBodyBehindAppBar: true,
//         backgroundColor: Theme.of(context).colorScheme.surface,
//         appBar: const EAppBar(
//           showBackArrow: false,
//           showImplyLeading: true,
//           color: Colors.transparent,
//         ),
//         drawer: const EDrawer(),
//         floatingActionButton: const EFloatingActionButton(),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   colorFilter: ColorFilter.mode(
//                       EColors.primary.withOpacity(EStyle.colorBlockOpacity),
//                       BlendMode.darken),
//                   image: const AssetImage(EImages.bg),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               height: height,
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 30.0, right: 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Obx(
//                       () {
//                         switch (controller.currentPage.value) {
//                           case 0:
//                             return const HomeScreen();
//                           case 1:
//                             return const AboutScreen2();
//                           case 2:
//                             return const PricingScreen();
//                           case 3:
//                             return const PlayerScreen();
//                           case 4:
//                             return GalleryScreen();
//                           case 5:
//                             return const ReservationScreen();
//                           default:
//                             return Container();
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
