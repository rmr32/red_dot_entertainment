import 'package:flutter/cupertino.dart';
import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class OnHoverAnimatedButton extends StatelessWidget {
  const OnHoverAnimatedButton({
    super.key,
    this.text = "Click Here",
    this.textColor = EColors.secondary,
    this.color = Colors.transparent,
    this.minWidth = 0,
    this.onPressed,
  });

  final String text;
  final Color textColor;
  final Color color;
  final double minWidth;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      onHover: (hovering) {
        // print('Widget hovered: $hovering');
      },
      hoverChild: WidgetAnimator(
        atRestEffect: WidgetRestingEffects.wave(),
        child: ECard(
          onPressed: onPressed,
          color: color,
          borderColor: EColors.secondary,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: minWidth),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
              child: Text(
                text.toUpperCase(),
                textAlign: TextAlign.center,
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: textColor,
                        )
                    : Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: textColor,
                        ),
              ),
            ),
          ),
        ),
      ),
      child: ECard(
        onPressed: onPressed,
        color: color,
        borderColor: EColors.accent,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: minWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                  ? Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                      )
                  : Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: textColor,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
