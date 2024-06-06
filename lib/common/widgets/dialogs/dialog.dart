import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EDialog extends StatelessWidget {
  const EDialog({
    super.key,
    this.child = const SizedBox(),
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    double width = EDeviceUtils.getScreenWidth();
    double height = EDeviceUtils.getScreenHeight();
    bool isMobile = width < ESizes.mobile;
    bool isTablet = width < ESizes.tablet && width >= ESizes.mobile;

    return Container(
      margin: isMobile
          ? EdgeInsets.symmetric(
              horizontal: width * 0.1, vertical: height * 0.1)
          : isTablet
              ? EdgeInsets.symmetric(
                  horizontal: width * 0.2, vertical: height * 0.1)
              : EdgeInsets.symmetric(
                  horizontal: width * 0.3, vertical: height * 0.1),
      decoration: BoxDecoration(
        color: EColors.primary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: EColors.secondary, width: 2),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                EImages.bgForm,
                height: EDeviceUtils.getScreenHeight() * 1.2,
                width: EDeviceUtils.getScreenWidth() * 1.2,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: AlertDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              insetPadding: const EdgeInsets.all(00),
              backgroundColor: Colors.transparent,
              content: SizedBox(width: isMobile ? width : width, child: child),
            ),
          ),
        ],
      ),
    );
  }
}
