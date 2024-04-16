import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EFormField {
  EFormField._();

  static final lightFormFieldTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ESizes.buttonElevation,
      foregroundColor: EColors.white,
      backgroundColor: EColors.buttonPrimary,
      disabledForegroundColor: EColors.buttonDisabled,
      disabledBackgroundColor: EColors.buttonDisabled,
      side: const BorderSide(color: EColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(vertical: ESizes.buttonHeight),
      textStyle: ETextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ESizes.buttonRadius)),
    ),
  );
  static final darkFormFieldTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: ESizes.buttonElevation,
      foregroundColor: EColors.primary,
      backgroundColor: EColors.white,
      disabledForegroundColor: EColors.buttonDisabled,
      disabledBackgroundColor: EColors.buttonDisabled,
      side: const BorderSide(color: EColors.buttonPrimary),
      padding: const EdgeInsets.symmetric(
          vertical: ESizes.md, horizontal: ESizes.xl),
      textStyle: ETextTheme.lightTextTheme.titleLarge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ESizes.borderRadiusMd)),
    ),
  );
}
