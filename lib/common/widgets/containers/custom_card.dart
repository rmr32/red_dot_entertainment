import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ECard extends StatelessWidget {
  const ECard({
    super.key,
    this.elevation = ESizes.elevationMd,
    this.color = Colors.transparent,
    this.borderColor = EColors.secondary,
    this.borderRadius = ESizes.borderRadiusSM,
    required this.child,
    this.onPressed,
  });

  final double elevation;
  final Color color;
  final Color borderColor;
  final double borderRadius;
  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: elevation,
        color: color,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor,
            width: ESizes.borderWidthMd,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
