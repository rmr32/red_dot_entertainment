import 'package:red_dot_entertainment/common/controllers/on_hover_button_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class OnHoverButton extends StatelessWidget {
  const OnHoverButton({
    super.key,
    this.text = 'Click Here',
    this.onPressed,
    this.controllerKey = '1',
  });

  final String text;
  final VoidCallback? onPressed;
  final String controllerKey;

  @override
  Widget build(BuildContext context) {
    final controller = OnHoverButtonController.instance;

    return MouseRegion(
      onEnter: (_) => controller.onEnter(controllerKey),
      onExit: (_) => controller.onExit(controllerKey),
      child: Obx(
        () => ElevatedButton(
          onHover: (value) {},
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: EDeviceUtils.isPortraitOrientation(context)
                ? MaterialStateProperty.all(
                    Size(EDeviceUtils.getScreenHeight() * 0.8, 0))
                : MaterialStateProperty.all(
                    Size(EDeviceUtils.getScreenWidth() * 0.5, 0)),
            animationDuration: const Duration(seconds: 1),
            backgroundColor: MaterialStateProperty.all<Color>(
              controller.isHovered[controllerKey]?.value ?? false
                  ? EColors.secondary
                  : EColors.accent,
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: controller.isHovered[controllerKey]?.value ?? false
                      ? EColors.textPrimary
                      : EColors.textWhite,
                ),
          ),
        ),
      ),
    );
  }
}
