import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ETextFormFieldTheme {
  ETextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: EColors.textSecondary,
    suffixIconColor: EColors.secondary,

    // constraints: BoxConstraints.expand(height: ESizes.inputFieldHeight),
    /// Initial Text in Box
    labelStyle: const TextStyle()
        .copyWith(fontSize: ESizes.fontSizeMd, color: EColors.textSecondary),
    hintStyle: const TextStyle().copyWith(
        fontSize: ESizes.fontSizeSm,
        color: EColors.textSecondary.withOpacity(0.8)),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle()
        .copyWith(color: EColors.textSecondary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: EColors.secondary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: EColors.secondary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: EColors.secondary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: EColors.accent),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(ESizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: EColors.accent),
    ),
  );
}
