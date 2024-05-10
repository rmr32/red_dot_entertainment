import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ETextTheme {
  ETextTheme._();

  static const headerFont = GoogleFonts.oswald;
  static const titleFont = GoogleFonts.lato;
  static const bodyFont = GoogleFonts.lato;

  static TextTheme lightTextTheme = TextTheme(
    /// --- Headlines --- ///
    //   if ( EDeviceUtils.getScreenWidth() < ESizes.mobile) {

    // headlineLarge: headerFont(
    //     textStyle: const TextStyle().copyWith(
    //         fontSize: ESizes.fontSizeHeadline * 2,
    //         fontWeight: FontWeight.bold,
    //         color: EColors.textPrimary),
    //   )
    //   }else {
    //       headlineLarge: headerFont(
    //     textStyle: const TextStyle().copyWith(
    //         fontSize: ESizes.fontSizeHeadline ,
    //         fontWeight: FontWeight.bold,
    //         color: EColors.textPrimary),
    //   ),
    //   }

    headlineLarge: headerFont(
      textStyle: const TextStyle().copyWith(
          fontSize: ESizes.fontSizeHeadline * 2,
          fontWeight: FontWeight.bold,
          color: EColors.textPrimary),
    ),
    headlineMedium: headerFont(
      textStyle: const TextStyle().copyWith(
          fontSize: ESizes.fontSizeHeadline,
          fontWeight: FontWeight.bold,
          color: EColors.textPrimary),
    ),
    headlineSmall: headerFont(
      textStyle: const TextStyle().copyWith(
          fontSize: ESizes.fontSizeHeadline - 10,
          fontWeight: FontWeight.bold,
          color: EColors.textPrimary),
    ),

    // headlineMedium: const TextStyle().copyWith(
    //     fontSize: 24, fontWeight: FontWeight.w600, color: EColors.textPrimary),

    /// --- Titles --- ///
    titleLarge: titleFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 35,
          fontWeight: FontWeight.w300,
          color: EColors.textPrimary),
    ),

    titleMedium: titleFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 30,
          fontWeight: FontWeight.w300,
          color: EColors.textPrimary),
    ),

    titleSmall: titleFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w300,
          color: EColors.textPrimary),
    ),

    // Body
    bodyLarge: bodyFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w300,
          color: EColors.textPrimary),
    ),

    bodyMedium: bodyFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: EColors.textPrimary),
    ),

    bodySmall: bodyFont(
      textStyle: const TextStyle().copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          color: EColors.textPrimary),
    ),

    // Label
    labelLarge: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: EColors.textPrimary),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: EColors.textPrimary.withOpacity(0.5)),
  );

  static TextTheme darkTextTheme = TextTheme(
    // Headlines
    headlineLarge: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: EColors.textPrimary)),
    headlineMedium: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: EColors.textWhite)),
    headlineSmall: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: EColors.textWhite)),

    // Titles
    titleLarge: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: EColors.textWhite)),
    titleMedium: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: EColors.textWhite)),
    titleSmall: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: EColors.textWhite)),

    // Body
    bodyLarge: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: EColors.textPrimary)),
    bodyMedium: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: EColors.textPrimary)),
    bodySmall: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: EColors.textWhite.withOpacity(0.5))),

    // Label
    labelLarge: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: EColors.textWhite)),
    labelMedium: GoogleFonts.rubik(
        textStyle: const TextStyle().copyWith(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: EColors.textWhite.withOpacity(0.5))),
  );
}


/// --- How to use:
/// --- style: Theme.of(context).textTheme.headlineMedium,
/// --- style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: EColors.accent),