import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/theme/custom_themes/drawer_theme.dart';
import 'package:red_dot_entertainment/utils/theme/slider_theme.dart';

class EAppTheme {
  EAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: ETextTheme.lightTextTheme,
    chipTheme: EChipTheme.lightChipTheme,
    // scaffoldBackgroundColor: EColors.backgroundLight,
    scaffoldBackgroundColor: EColors.primary,
    appBarTheme: EAppBarTheme.lightAppBarTheme,
    drawerTheme: EDrawerTheme.lightDrawerTheme,
    checkboxTheme: ECheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    sliderTheme: ESliderTheme.lightSliderTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: EColors.primary,
      onPrimary: EColors.containerLight,
      secondary: EColors.secondary,
      onSecondary: EColors.primary,
      error: EColors.error,
      onError: EColors.black,
      background: EColors.backgroundDark,
      onBackground: EColors.primary,
      surface: EColors.tertiary,
      onSurface: EColors.primary,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: ETextTheme.darkTextTheme,
    chipTheme: EChipTheme.darkChipTheme,
    scaffoldBackgroundColor: EColors.bg,
    appBarTheme: EAppBarTheme.darkAppBarTheme,
    checkboxTheme: ECheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: EBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: EElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: EOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: ETextFormFieldTheme.lightInputDecorationTheme,
    sliderTheme: ESliderTheme.darkSliderTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: EColors.primary,
      onPrimary: EColors.containerLight,
      secondary: EColors.secondary,
      onSecondary: EColors.primary,
      error: EColors.error,
      onError: EColors.black,
      background: EColors.backgroundDark,
      onBackground: EColors.primary,
      surface: EColors.tertiary,
      onSurface: EColors.primary,
    ),
  );
}
