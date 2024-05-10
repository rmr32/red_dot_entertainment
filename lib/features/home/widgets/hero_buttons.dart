import 'package:hovering/hovering.dart';
import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class EHeroButton extends StatelessWidget {
  const EHeroButton({this.onPressed, super.key});

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
              'BOOK',
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
            'BOOK',
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
