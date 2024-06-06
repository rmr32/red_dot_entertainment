import 'package:red_dot_entertainment/utils/constants/exports.dart';

import 'package:responsive_builder/responsive_builder.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  // return Image.asset(
                  //   height: height - (height * 0.2 * offScreenPercentage),
                  //   width: width - (width * 0.5 * offScreenPercentage),
                  //   EImages.bgForm,
                  //   fit: BoxFit.cover,
                  // );
                  return Container(
                      height: height - (height * 0.2 * offScreenPercentage),
                      width: width - (width * (0.5 * offScreenPercentage)),
                      color: EColors.primary,
                      child: const HeroVideo());
                },
                offsetBuilder: (scrollOffset) {
                  final offScreenPercentage = min(scrollOffset / height, 1.0);
                  final heightShrinkageAmount =
                      height * 0.2 * offScreenPercentage;
                  final bool startMovingImage = scrollOffset >= height;
                  final double onScreenOffset =
                      scrollOffset + heightShrinkageAmount / 2;
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
                    child: const Center(
                      child: HeroBody(),
                    ),
                  );
                },
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
            ],
          ),
          const ENavBar(),
        ],
      ),
    );
  }
}
