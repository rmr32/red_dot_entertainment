import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// class HeroVideo extends StatefulWidget {
//   const HeroVideo({super.key});

//   @override
//   State<HeroVideo> createState() => _HeroVideoState();
// }

// class _HeroVideoState extends State<HeroVideo> {
//   late CachedVideoPlayerController _videoPlayerController;

//   late CustomVideoPlayerController _customVideoPlayerController;
//   final CustomVideoPlayerSettings _customVideoPlayerSettings =
//       const CustomVideoPlayerSettings(
//     customAspectRatio: 9 / 20,
//     controlBarAvailable: false,
//     playOnlyOnce: false,
//   );

//   @override
//   void initState() {
//     initializeVideoPlayer();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomVideoPlayer(
//         customVideoPlayerController: _customVideoPlayerController);
//   }

//   void initializeVideoPlayer() async {
//     // CachedVideoPlayerController videoPlayerController;
//     _videoPlayerController = CachedVideoPlayerController.asset(
//       'assets/video/hero.mp4',
//     )..initialize().then((value) async => setState(() {}));

//     _customVideoPlayerController = CustomVideoPlayerController(
//         context: context,
//         videoPlayerController: _videoPlayerController,
//         customVideoPlayerSettings: _customVideoPlayerSettings);
//     _videoPlayerController.setVolume(0.0);
//     _videoPlayerController.setLooping(true);
//     _videoPlayerController.setPlaybackSpeed(0.5);
//     _videoPlayerController.play();
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }
// }

class HeroVideo extends StatefulWidget {
  const HeroVideo({super.key});

  @override
  State<HeroVideo> createState() => _HeroVideoState();
}

class _HeroVideoState extends State<HeroVideo> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    _videoController = VideoPlayerController.asset('assets/video/hero.mp4')
      ..initialize().then((_) {
        _videoController.setVolume(0);
        _videoController.setPlaybackSpeed(0.5);
        _videoController.play();
        _videoController.setLooping(true);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => VideoPlayer(_videoController);
}
