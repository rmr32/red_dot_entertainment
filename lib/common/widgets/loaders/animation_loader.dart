import 'package:lottie/lottie.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

/// --- Widget displaying an animated loading indicator (lottie) with optional text and action button --- ///
class EAnimationLoader extends StatelessWidget {
  /// --- Parameters --- ///
  ///       --- text: The text to be displayed below the animation
  ///       --- animation: The path to the Lottie animation file
  ///       --- showAction: Show an action button below the text
  ///       --- actionText: Text displayed on the action button
  ///       --- onActionPressed: Callback Fuction to be executed when pressed
  const EAnimationLoader({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: EDeviceUtils.getScreenWidth() * 0.8),
          const SizedBox(height: ESizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: ESizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: ESizes.buttonWidth * 2,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style: OutlinedButton.styleFrom(
                        backgroundColor: EColors.backgroundDark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: EColors.textWhite),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
