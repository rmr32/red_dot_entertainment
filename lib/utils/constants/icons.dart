import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EIcons {
  EIcons._();

  /// ------------------------------------------------------------------ ///
  /// --- ICONS --- ///
  ///
  ///
  ///

  /// --- Social Media Icons --- ///
  static const Icon twitch = Icon(FontAwesomeIcons.twitch);
  static const Icon twitchHover = Icon(
    FontAwesomeIcons.twitch,
    color: EColors.accent,
  );
  // FaIcon(FontAwesomeIcons.twitch, color: EColors.secondary);
  static const Icon youtube = Icon(FontAwesomeIcons.youtube);
  static const Icon youtubeHover = Icon(
    FontAwesomeIcons.youtube,
    color: EColors.accent,
  );
  // FaIcon(FontAwesomeIcons.youtube, color: EColors.secondary);
  static const Icon instagram = Icon(FontAwesomeIcons.instagram);
  static const Icon instagramHover = Icon(
    FontAwesomeIcons.instagram,
    color: EColors.accent,
  );
  // FaIcon(FontAwesomeIcons.instagram, color: EColors.secondary);

  /// --- Newsletter Icons --- ///
  static const Icon newsletter = Icon(FontAwesomeIcons.envelope);
  static const Icon newsletterHover = Icon(
    FontAwesomeIcons.envelope,
    color: EColors.accent,
  );
  // FaIcon(FontAwesomeIcons.newspaper, color: EColors.secondary);

  /// --- Audio Player Icons --- ///
  static const Icon play = Icon(FontAwesomeIcons.play);
  static const Icon pause = Icon(FontAwesomeIcons.pause);
  static const Icon next = Icon(FontAwesomeIcons.forward);
  static const Icon previous = Icon(FontAwesomeIcons.backward);
  static const Icon shuffle = Icon(FontAwesomeIcons.shuffle);
  static const Icon loop = Icon(FontAwesomeIcons.repeat);

  /// ------------------------------------------------------------------ ///
  /// --- Animations --- ///
  ///
  ///
  ///
  static const String animationLoadingInformation =
      'assets/images/animations/loading_information.json';
  static const String animationSuccessfulAnimation =
      'assets/images/animations/loading_information.json';
  static const String animationDocer =
      'assets/images/animations/loading_information.json';
  static const String animationCloudUploading =
      'assets/images/animations/loading_information.json';
  static const String animationOrderProcessing =
      'assets/images/animations/loading_information.json';
  static const String animationOrderCompleted =
      'assets/images/animations/loading_information.json';
  static const String animationCartEmpty =
      'assets/images/animations/loading_information.json';
}
