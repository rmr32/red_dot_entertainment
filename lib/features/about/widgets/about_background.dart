import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutBackground extends StatelessWidget {
  const AboutBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WidgetMask(
      blendMode: BlendMode.srcATop,
      childSaveLayer: true,
      // mask: AnimateGradient(
      //   duration: const Duration(seconds: 3),
      //   primaryColors: const [
      //     EColors.secondary,
      //     EColors.accent,
      //     EColors.accent,
      //     // EColors.secondary
      //   ],
      //   secondaryColors: const [
      //     EColors.accent,
      //     EColors.accent,
      //     EColors.secondary,
      //     // EColors.accent
      //   ],
      // ),
      mask: Image.asset(
        EImages.studio2,
        fit: BoxFit.cover,
      ),
      child: SvgPicture.asset(
        width:
            EDeviceUtils.getScreenWidth() > ESizes.mobile ? null : width * 0.8,
        'assets/images/red_texas.svg',
      ),
    );
  }
}
