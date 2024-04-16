import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ECheckboxTheme {
  ECheckboxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    side: const BorderSide(color: EColors.buttonPrimary),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ESizes.cardRadiusXs)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EColors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return EColors.buttonPrimary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
