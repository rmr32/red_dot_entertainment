import 'package:red_dot_entertainment/common/controllers/on_hover_button_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class OnHoverIcon extends StatelessWidget {
  const OnHoverIcon(
      {super.key,
      required this.icon,
      this.onPressed,
      this.color,
      required this.controllerKey,
      this.isSmall = false});

  final Icon icon;
  final VoidCallback? onPressed;
  final Color? color;
  final String controllerKey;
  final bool isSmall;

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
            shape:
                MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
            elevation: MaterialStateProperty.all<double>(5),
            padding: isSmall
                ? MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(9))
                : MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(18)),
            animationDuration: const Duration(seconds: 1),
            side: MaterialStateProperty.all(BorderSide.none),
            backgroundColor: controller.isHovered[controllerKey]?.value ?? false
                ? MaterialStateProperty.all<Color>(Colors.red)
                : MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Icon(
            size: isSmall ? 15 : 25,
            icon.icon,
            color: color ??
                (controller.isHovered[controllerKey]?.value ?? false
                    ? EColors.secondary
                    : EColors.primary),
          ),
        ),
      ),
    );
  }
}
