import 'package:red_dot_entertainment/utils/constants/exports.dart';

/// A circular loader widget with customizable foreground and background colors.
class ECircularLoader extends StatelessWidget {
  /// Default constructor for the ECircularLoader.
  ///
  /// Parameters:
  ///   - foregroundColor: The color of the circular loader.
  ///   - backgroundColor: The background color of the circular loader.
  const ECircularLoader({
    super.key,
    this.foregroundColor = EColors.white,
    this.backgroundColor = EColors.primary,
  });

  final Color? foregroundColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ESizes.lg),
      decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle), // Circular background
      child: Center(
        child: CircularProgressIndicator(
            color: foregroundColor,
            backgroundColor: Colors.transparent), // Circular loader
      ),
    );
  }
}
