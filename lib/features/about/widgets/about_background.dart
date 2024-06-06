import 'package:animate_gradient/animate_gradient.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AboutBackground extends StatelessWidget {
  const AboutBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = EDeviceUtils.getScreenWidth();
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    // double height = EDeviceUtils.getScreenHeight();

    final isMobile = width < ESizes.mobile;

    return WidgetAnimator(
      atRestEffect: WidgetRestingEffects.wave(effectStrength: 0.3),
      child: WidgetMask(
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
        //     EColors.primary,
        //     EColors.secondary,
        //     // EColors.accent
        //   ],
        // ),
        mask: Image.asset(
          color: isMobile ? EColors.primary.withOpacity(0.2) : EColors.primary,
          EImages.studio2,
          fit: BoxFit.cover,
        ),
        child: SvgPicture.asset(
          // width: isMobile ? width : width * 0.8,
          height: height / 3,
          // fit: BoxFit.contain,
          EImages.bgAbout,
        ),
      ),
    );
  }
}
