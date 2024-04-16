import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EOutlinedButtonTheme {
  EOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      // elevation: 0,
      elevation: ESizes.buttonElevation,
      foregroundColor: EColors.textPrimary,
      side: const BorderSide(color: EColors.buttonPrimary),
      textStyle: ETextTheme.lightTextTheme.titleLarge,
      padding: const EdgeInsets.symmetric(
          vertical: ESizes.md, horizontal: ESizes.lg),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ESizes.buttonRadius)),
    ),
  );
}
