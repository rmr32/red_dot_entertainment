import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EAppBarTheme {
  EAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: EColors.secondary, size: 24),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: EColors.textWhite, size: 24),
    actionsIconTheme: IconThemeData(color: EColors.textWhite, size: 24),
    titleTextStyle: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
  );
}
