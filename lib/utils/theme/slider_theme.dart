import 'package:red_dot_entertainment/utils/constants/exports.dart';

class ESliderTheme {
  ESliderTheme._();

  static SliderThemeData lightSliderTheme = const SliderThemeData(
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
  );
  static SliderThemeData darkSliderTheme = const SliderThemeData(
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
    // thumbShape: CustomThumbShape(
    //     thumbRadius: 5, // Change thumb radius if needed
    //     imageProvider: const AssetImage('assets/logos/logo.png')),
  );
}
