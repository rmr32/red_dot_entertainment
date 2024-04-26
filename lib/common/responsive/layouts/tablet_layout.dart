import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/common/widgets/drawer/drawer.dart';
import 'package:red_dot_entertainment/common/widgets/fab/floating_action_button.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  @override
  Widget build(BuildContext context) {
    final controller = NavigationController.instance;
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = EDeviceUtils.getScreenHeight();
        double width = EDeviceUtils.getScreenWidth();
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          // floatingActionButton: const EFloatingActionButton(),
          body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    EColors.primary.withOpacity(EStyle.colorBlockOpacity),
                    BlendMode.darken),
                image: const AssetImage(EImages.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Navigation --- ///
                const Expanded(
                  flex: 2,
                  child: EDrawer(isRounded: false),
                ),

                /// --- Content --- ///
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: EColors.tertiary
                            .withOpacity(EStyle.colorBlockOpacity),
                        height: height,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                                  () {
                                    switch (controller.currentPage.value) {
                                      // case 0:
                                      //   return const HomeScreen();
                                      // case 1:
                                      //   return const AboutScreen2();

                                      // case 2:
                                      //   return const PricingScreen();
                                      // case 3:
                                      //   return const PlayerScreen();
                                      // case 4:
                                      //   return GalleryScreen();
                                      // case 5:
                                      //   return const ReservationScreen();
                                      default:
                                        return Container();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
