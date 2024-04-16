import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EChipTheme {
  EChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: EColors.primary),
    selectedColor: EColors.accent,
    padding: const EdgeInsets.symmetric(
        horizontal: ESizes.defaultSpace / 2, vertical: ESizes.defaultSpace / 2),
    checkmarkColor: EColors.primary,
  );
  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: EColors.backgroundDark),
    selectedColor: EColors.accent,
    padding: const EdgeInsets.symmetric(
        horizontal: ESizes.defaultSpace / 2, vertical: ESizes.defaultSpace / 2),
    checkmarkColor: EColors.backgroundDark,
  );
}
