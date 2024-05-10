import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AboutPageDots extends StatelessWidget {
  const AboutPageDots({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      onDotClicked: (index) => controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ),
      controller: controller,
      count: 3,
      // effect: const ExpandingDotsEffect(
      //     activeDotColor: EColors.accent, dotHeight: 55),
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 15,
          height: 36,
          color: EColors.accent,
          // rotationAngle: 180,
          verticalOffset: -10,
          borderRadius: BorderRadius.circular(24),
          // dotBorder: DotBorder(
          //   padding: 2,
          //   width: 2,
          //   color: Colors.indigo,
          // ),
        ),
        dotDecoration: DotDecoration(
          width: 15,
          height: 15,
          color: EColors.secondary,
          // dotBorder: DotBorder(
          //   padding: 2,
          //   width: 2,
          //   color: Colors.grey,
          // ),
          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(2),
          //     topRight: Radius.circular(16),
          //     bottomLeft: Radius.circular(16),
          //     bottomRight: Radius.circular(2)),
          borderRadius: BorderRadius.circular(16),
          verticalOffset: 0,
        ),
        spacing: 6.0,
        // activeColorOverride: (i) => colors[i],
        // inActiveColorOverride: (i) => colors[i],
      ),
    );
  }
}
