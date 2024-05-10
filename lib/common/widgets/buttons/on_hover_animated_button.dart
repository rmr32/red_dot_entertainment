import 'package:flutter/cupertino.dart';
import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class OnHoverAnimatedButton extends StatelessWidget {
  const OnHoverAnimatedButton({
    super.key,
    this.text = "Book",
    this.onPressed,
  });

  final String text;
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
          borderColor: EColors.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                  ? Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: EColors.secondary,
                      )
                  : Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: EColors.secondary,
                      ),
            ),
          ),
        ),
      ),
      child: ECard(
        borderColor: EColors.accent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                ? Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: EColors.secondary,
                    )
                : Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: EColors.secondary,
                    ),
          ),
        ),
      ),
    );
  }
}
