import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EColors {
  EColors._();

  static const Color test = Color(0xFFe13c33);

  /// --- App Basic Colors --- ///
  ///
  ///
  static const Color primary = Colors.black;
  static const Color secondary = Colors.white;
  static const Color tertiary = Color.fromARGB(255, 73, 73, 73);

  static const Color accent = Color(0xFFe13c33);

  // static const Color bg = Color(0xFF011247);
  static const Color bg = Colors.transparent;
  static const Color appBar = Colors.transparent;

  /// --- Background Colors --- ///
  static const Color backgroundLight = EColors.white;
  static const Color backgroundDark = EColors.primary;

  /// --- Gradient Colors --- ///
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0, 0),
    colors: [
      Color.fromARGB(255, 12, 117, 124),
      Color.fromARGB(255, 95, 36, 172),
      Color.fromARGB(255, 0, 195, 255),
    ],
  );

  /// --- Text Colors --- ///
  static const Color textPrimary = primary;
  static const Color textSecondary = secondary;
  static const Color textWhite = backgroundLight;

  /// --- Background Container Colors --- ///
  static const Color containerLight = secondary;
  static const Color containerDark = tertiary;

  /// --- Button Colors --- ///
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = backgroundDark;

  /// --- Border Colors --- ///
  static const Color borderPrimary = primary;
  static const Color borderSecondary = secondary;

  /// --- Shimmer Colors --- ///
  static const Color shimmerBaseDark = backgroundDark;
  static const Color shimmerBaseLight = backgroundLight;
  static const Color shimmerHighlightDark = tertiary;
  static const Color shimmerHighlightLight = secondary;
  static const Color shimmerBorderDark = backgroundLight;
  static const Color shimmerBorderLight = backgroundDark;

  // Error and Validation Colors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.yellow;
  static const Color info = Color(0xFF4B68FF);

  // Neutral Shades
  static const Color black = Colors.black;
  static const Color darkGrey = Colors.grey;
  static const Color grey = Colors.blueGrey;
  static const Color softGrey = Colors.deepOrangeAccent;
  static const Color white = Colors.white;
  static const Color greyDark = Color.fromARGB(255, 78, 78, 78);

  /// --- Product Colors --- ///
  static const Color red = Colors.red;
  static const Color green = Colors.green;
  static const Color blue = Colors.blue;
}
