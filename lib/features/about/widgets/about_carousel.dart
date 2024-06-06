import 'package:flutter/cupertino.dart';
import 'package:red_dot_entertainment/features/about/widgets/glass.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutCarousel extends StatelessWidget {
  const AboutCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    double height = EDeviceUtils.getScreenHeight();
    double width = EDeviceUtils.getScreenWidth();

    final isMobile = width < ESizes.mobile;

    final PageController controller =
        PageController(viewportFraction: isMobile ? 0.8 : 1);

    return Padding(
      padding: EdgeInsets.only(
          left: isMobile
              // ? 30.0
              ? 0.0
              : 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.7,

            /// --- ABOUT PAGES --- ///
            child: PageView(
              controller: controller,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: AboutPrimary(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: AboutSecondary(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: AboutProducer(),
                ),
              ],
            ),
          ),
          const SizedBox(height: ESizes.spaceBtwSections),

          /// --- PAGE INDICATOR --- ///
          AboutPageDots(controller: controller),
        ],
      ),
    );
  }
}
