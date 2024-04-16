import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EStyle {
  EStyle._();
  static const double colorBlockOpacity = 0.7;

  static TextStyle primary = GoogleFonts.anton(
    fontSize: 12.0,
    color: EColors.textPrimary,
    fontWeight: FontWeight.normal,
    shadows: const [
      Shadow(
        blurRadius: 3,
        color: EColors.primary,
        offset: Offset(1.0, 1.0),
      )
    ],
  );

  // static TextStyle header1 = GoogleFonts.oswald(
  //   fontSize: 52.0,
  //   color: EColors.lightColor,
  //   fontWeight: FontWeight.bold,
  //   decoration: TextDecoration.none,
  //   shadows: [
  //     const Shadow(
  //       blurRadius: 7,
  //       color: EColors.darkColor,
  //       offset: Offset(3.0, 3.0),
  //     )
  //   ],
  // );
  // static TextStyle header3 = const TextStyle(
  //   // fontFamily: 'Ubuntu',
  //   fontSize: 27.0,
  //   // color: EColors.textDark,
  //   fontWeight: FontWeight.w500,
  //   shadows: [
  //     Shadow(
  //       blurRadius: 5,
  //       // color: EColors.primaryContainer,
  //       color: Colors.black,
  //       offset: Offset(2.0, 2.0),
  //     )
  //   ],
  // );
  // static TextStyle header5 = const TextStyle(
  //   // fontFamily: 'Ubuntu',
  //   fontSize: 22.0,
  //   // color: EColors.textDark,
  //   fontWeight: FontWeight.bold,
  //   shadows: [
  //     Shadow(
  //       blurRadius: 1,
  //       // color: EColors.primaryContainer,
  //       color: Colors.black,
  //       offset: Offset(0.3, 0.3),
  //     )
  //   ],
  // );
  // static TextStyle oilName = const TextStyle(
  //   fontFamily: Const.oilFont,
  //   fontSize: 22.0,
  //   color: EColors.lightColor,
  //   shadows: [
  //     Shadow(
  //       blurRadius: 1,
  //       // color: EColors.primaryContainer,
  //       color: Colors.black,
  //       offset: Offset(0.3, 0.3),
  //     )
  //   ],
  // );
}

// class Interface {
//   // Simple preloader inside a Center widget
//   static const preloader =
//       Center(child: CircularProgressIndicator(color: EColors.lightColor));
// }
