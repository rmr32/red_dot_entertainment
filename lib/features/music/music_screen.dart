// import 'package:flutter_animate/flutter_animate.dart';

// import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
// import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
// import 'package:red_dot_entertainment/features/music/models/controllers/playlist_controller.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';
// import 'package:red_dot_entertainment/utils/device/device_utility.dart';
// import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';

import 'package:red_dot_entertainment/common/widgets/containers/custom_card.dart';
import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/features/music/controllers/playlist_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';
import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';
import 'package:widget_mask/widget_mask.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController.instance;

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          /// --- Headline --- ///
          Text(
            textAlign: TextAlign.center,
            EText.beats.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: EColors.secondary),
          ),
          WidgetMask(
            blendMode: BlendMode.srcATop,
            childSaveLayer: true,
            mask: Image.asset(
              EImages.studio1,
              fit: BoxFit.cover,
              height: 300,
            ),
            child: Image.asset(
              'assets/images/soundwave_large.gif',
              height: 300,
            ),
          ),

          /// --- Playlist --- ///
          Column(
            children: [
              ECard(
                child: SizedBox(
                  height: 320,
                  width: 500,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: playlistController.playlist.length,
                    itemBuilder: (context, index) {
                      final songModel = playlistController.playlist[index];
                      return ListTile(
                        // contentPadding: EdgeInsets.zero,

                        /// --- Album Art  --- ///
                        leading: ClipRRect(
                          clipBehavior: Clip.antiAlias,
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            songModel.albumArt,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),

                        /// --- Artist Name --- ///
                        title: Text(
                          songModel.songName,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: EColors.secondary,
                                  ),
                        ),

                        /// --- Song Name --- ///
                        subtitle: Text(
                          songModel.artistName,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: EColors.secondary,
                                  ),
                        ),

                        /// --- On Tap --- ///
                        onTap: () {
                          playlistController.changeSong(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              //           /// --- Song Player --- ///
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ECard(
                  child: SizedBox(
                    width: 500,
                    child: Row(
                      children: [
                        /// --- Artwork --- ///
                        width < ESizes.mobile
                            ? const SizedBox.shrink()
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Obx(
                                  () => Image.asset(
                                    playlistController
                                        .playlist[playlistController
                                            .currentSong.value]
                                        .albumArt,
                                    // height: width < ESizes.tablet ? 70 : 120,
                                    height: 120,
                                    // width: width < ESizes.tablet ? 70 : 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                        // / --- Song Information and Controls --- ///
                        Expanded(
                          child: Padding(
                            padding: width < ESizes.mobile
                                ? const EdgeInsets.only(
                                    left: 2, right: 2, top: 12, bottom: 0)
                                : const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// --- Artist Name --- ///
                                        Obx(
                                          () => Text(
                                            playlistController
                                                .playlist[playlistController
                                                    .currentSong.value]
                                                .artistName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: EColors.secondary,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 9,
                                                ),
                                          ),
                                        ),

                                        /// --- Song Title --- ///
                                        Obx(
                                          () => Text(
                                            playlistController
                                                .playlist[playlistController
                                                    .currentSong.value]
                                                .songName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                  color: EColors.secondary,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                          ),
                                        ),
                                      ]),
                                ),

                                /// --- Duration Section --- ///
                                Padding(
                                  padding: width < ESizes.mobile
                                      ? const EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 0)
                                      : const EdgeInsets.symmetric(
                                          horizontal: 25.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() => Text(
                                          EHelperFunctions.getFormattedTime(
                                                  playlistController
                                                      .currentDuration.value)
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: EColors.secondary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ))),

                                      /// --- Slider --- ///
                                      Obx(
                                        () => Slider(
                                          min: 0,
                                          max: playlistController
                                              .totalDuration.value.inSeconds
                                              .toDouble(),
                                          value: playlistController
                                              .currentDuration.value.inSeconds
                                              .toDouble(),
                                          activeColor: EColors.accent,
                                          onChanged: (double value) {
                                            playlistController.seek(Duration(
                                                seconds: value.toInt()));
                                          },
                                          onChangeEnd: (double value) {
                                            playlistController.seek(Duration(
                                                seconds: value.toInt()));
                                          },
                                        ),
                                      ),
                                      Obx(() => Text(
                                          EHelperFunctions.getFormattedTime(
                                                  playlistController
                                                      .totalDuration.value)
                                              .toString(),
                                          // For Time Left use:
                                          // duration - position
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: EColors.secondary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ))),
                                    ],
                                  ),
                                ),

                                /// --- Playlist Controls --- ///
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OnHoverIcon(
                                      icon: EIcons.previous,
                                      controllerKey: '2',
                                      onPressed: () {
                                        playlistController.playPreviousSong();
                                      },
                                    ),
                                    Obx(
                                      () => OnHoverIcon(
                                        icon: playlistController.isPlaying.value
                                            ? EIcons.pause
                                            : EIcons.play,
                                        controllerKey: '3',
                                        onPressed: () {
                                          playlistController.pauseOrResume();
                                        },
                                      ),
                                    ),
                                    OnHoverIcon(
                                      icon: EIcons.next,
                                      controllerKey: '4',
                                      onPressed: () {
                                        playlistController.playNextSong();
                                      },
                                    ),
                                    Obx(
                                      () => OnHoverIcon(
                                        color:
                                            playlistController.isLoopMode.value
                                                ? EColors.accent
                                                : null,
                                        icon: EIcons.loop,
                                        controllerKey: '5',
                                        onPressed: () {
                                          playlistController.loop();
                                        },
                                      ),
                                    ),
                                    // OnHoverIcon(
                                    //   icon: EIcons.shuffle,
                                    //   controllerKey: '6',
                                    //   onPressed: () {
                                    //     playlistController.stop();
                                    //   },
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// class MusicScreen extends StatelessWidget {
//   const MusicScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final playlistController = PlaylistController.instance;

//     double height = EDeviceUtils.getScreenHeight();
//     double width = EDeviceUtils.getScreenWidth();

//     return Center(
//       child: Column(
//         children: [
//           const SizedBox(height: ESizes.spaceBtwSections * 3),

//           /// --- Headline --- ///
//           Text(
//             textAlign: TextAlign.center,
//             EText.beats.toUpperCase(),
//             style: Theme.of(context)
//                 .textTheme
//                 .headlineMedium!
//                 .copyWith(color: EColors.secondary),
//           ),

//           /// --- Playlist --- ///
//           ECard(
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: playlistController.playlist.length,
//               itemBuilder: (context, index) {
//                 final songModel = playlistController.playlist[index];
//                 return ListTile(
//                   /// --- Album Art  --- ///
//                   leading: ClipRRect(
//                     borderRadius: BorderRadius.circular(80),
//                     child: Image.asset(
//                       songModel.albumArt,
//                       height: 100,
//                       width: 80,
//                       fit: BoxFit.cover,
//                       alignment: Alignment.topCenter,
//                     ),
//                   ),

//                   /// --- Artist Name --- ///
//                   title: Text(
//                     songModel.songName,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           color: EColors.secondary,
//                         ),
//                   ),

//                   /// --- Song Name --- ///
//                   subtitle: Text(
//                     songModel.artistName,
//                     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                           color: EColors.secondary,
//                         ),
//                   ),

//                   /// --- On Tap --- ///
//                   onTap: () {
//                     playlistController.changeSong(index);
//                   },
//                 );
//               },
//             ),
//           ),

//           /// --- Song Player --- ///
//           Padding(
//             padding: const EdgeInsets.only(bottom: 30),
//             child: ECard(
//               child: Row(
//                 children: [
//                   /// --- Artwork --- ///
//                   width < ESizes.mobile
//                       ? const SizedBox.shrink()
//                       : ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: Obx(
//                             () => Image.asset(
//                               playlistController
//                                   .playlist[
//                                       playlistController.currentSong.value]
//                                   .albumArt,
//                               // height: width < ESizes.tablet ? 70 : 120,
//                               height: 120,
//                               // width: width < ESizes.tablet ? 70 : 150,
//                               width: 150,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),

//                   // / --- Song Information and Controls --- ///
//                   Expanded(
//                     child: Padding(
//                       padding: width < ESizes.mobile
//                           ? const EdgeInsets.only(
//                               left: 2, right: 2, top: 12, bottom: 0)
//                           : const EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 15.0),
//                             child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   /// --- Artist Name --- ///
//                                   Obx(
//                                     () => Text(
//                                       playlistController
//                                           .playlist[playlistController
//                                               .currentSong.value]
//                                           .artistName,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall!
//                                           .copyWith(
//                                             color: EColors.secondary,
//                                             fontWeight: FontWeight.w300,
//                                             fontSize: 9,
//                                           ),
//                                     ),
//                                   ),

//                                   /// --- Song Title --- ///
//                                   Obx(
//                                     () => Text(
//                                       playlistController
//                                           .playlist[playlistController
//                                               .currentSong.value]
//                                           .songName,
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall!
//                                           .copyWith(
//                                             color: EColors.secondary,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 10,
//                                           ),
//                                     ),
//                                   ),
//                                 ]),
//                           ),

//                           /// --- Duration Section --- ///
//                           Padding(
//                             padding: width < ESizes.mobile
//                                 ? const EdgeInsets.only(
//                                     left: 15, right: 15, top: 10, bottom: 0)
//                                 : const EdgeInsets.symmetric(horizontal: 25.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Obx(() => Text(
//                                     EHelperFunctions.getFormattedTime(
//                                             playlistController
//                                                 .currentDuration.value)
//                                         .toString(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(
//                                           color: EColors.secondary,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 10,
//                                         ))),

//                                 /// --- Slider --- ///
//                                 Obx(
//                                   () => Slider(
//                                     min: 0,
//                                     max: playlistController
//                                         .totalDuration.value.inSeconds
//                                         .toDouble(),
//                                     value: playlistController
//                                         .currentDuration.value.inSeconds
//                                         .toDouble(),
//                                     activeColor: EColors.accent,
//                                     onChanged: (double value) {
//                                       playlistController.seek(
//                                           Duration(seconds: value.toInt()));
//                                     },
//                                     onChangeEnd: (double value) {
//                                       playlistController.seek(
//                                           Duration(seconds: value.toInt()));
//                                     },
//                                   ),
//                                 ),
//                                 Obx(() => Text(
//                                     EHelperFunctions.getFormattedTime(
//                                             playlistController
//                                                 .totalDuration.value)
//                                         .toString(),
//                                     // For Time Left use:
//                                     // duration - position
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(
//                                           color: EColors.secondary,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 10,
//                                         ))),
//                               ],
//                             ),
//                           ),

//                           /// --- Playlist Controls --- ///
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               OnHoverIcon(
//                                 icon: EIcons.previous,
//                                 controllerKey: '2',
//                                 onPressed: () {
//                                   playlistController.playPreviousSong();
//                                 },
//                               ),
//                               Obx(
//                                 () => OnHoverIcon(
//                                   icon: playlistController.isPlaying.value
//                                       ? EIcons.pause
//                                       : EIcons.play,
//                                   controllerKey: '3',
//                                   onPressed: () {
//                                     print(playlistController
//                                         .playlist[playlistController
//                                             .currentSong.value]
//                                         .songName);
//                                     playlistController.pauseOrResume();
//                                   },
//                                 ),
//                               ),
//                               OnHoverIcon(
//                                 icon: EIcons.next,
//                                 controllerKey: '4',
//                                 onPressed: () {
//                                   playlistController.playNextSong();
//                                 },
//                               ),
//                               Obx(
//                                 () => OnHoverIcon(
//                                   color: playlistController.isLoopMode.value
//                                       ? EColors.accent
//                                       : null,
//                                   icon: EIcons.loop,
//                                   controllerKey: '5',
//                                   onPressed: () {
//                                     playlistController.loop();
//                                   },
//                                 ),
//                               ),
//                               // OnHoverIcon(
//                               //   icon: EIcons.shuffle,
//                               //   controllerKey: '6',
//                               //   onPressed: () {
//                               //     playlistController.stop();
//                               //   },
//                               // ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ).animate().fadeIn(duration: 750.ms, curve: Curves.easeIn);
//   }
// }



// class BackgroundShapes extends StatefulWidget {
//   const BackgroundShapes({
//     super.key,
//     required this.child,
//   });

//   final Widget child;

//   @override
//   State<BackgroundShapes> createState() => _BackgroundShapesState();
// }

// class _BackgroundShapesState extends State<BackgroundShapes>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 10),
//     );
//     _animation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(_controller);
//     _controller.repeat(reverse: true);
//     super.initState();
//   }

//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Stack(
//         children: [
//           AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               return CustomPaint(
//                 painter: BackgroundPainter(_animation),
//                 child: Container(),
//               );
//             },
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
//             child: Container(
//               color: Colors.transparent,
//             ),
//           ),
//           widget.child,
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.removeStatusListener((status) {});
//     _controller.dispose();
//     super.dispose();
//   }
// }

// class BackgroundPainter extends CustomPainter {
//   final Animation<double> animation;

//   const BackgroundPainter(this.animation);

//   Offset getOffset(Path path) {
//     final pms = path.computeMetrics(forceClosed: false).elementAt(0);
//     final length = pms.length;
//     final offset = pms.getTangentForOffset(length * animation.value)!.position;
//     return offset;
//   }

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint();
//     paint.maskFilter = const MaskFilter.blur(
//       BlurStyle.normal,
//       30,
//     );
//     drawShape1(canvas, size, paint, EColors.accent);
//     drawShape2(canvas, size, paint, EColors.accent);
//     drawShape3(canvas, size, paint, EColors.accent);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return oldDelegate != this;
//   }

//   void drawShape1(
//     Canvas canvas,
//     Size size,
//     Paint paint,
//     Color color,
//   ) {
//     paint.color = color;
//     Path path = Path();

//     path.moveTo(size.width, 0);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height / 2,
//       -100,
//       size.height / 4,
//     );

//     final offset = getOffset(path);
//     canvas.drawCircle(offset, 150, paint);
//   }

//   void drawShape2(
//     Canvas canvas,
//     Size size,
//     Paint paint,
//     Color color,
//   ) {
//     paint.color = color;
//     Path path = Path();

//     path.moveTo(size.width, size.height);
//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height / 2,
//       size.width * 0.9,
//       size.height * 0.9,
//     );

//     final offset = getOffset(path);
//     canvas.drawCircle(offset, 250, paint);
//   }

//   void drawShape3(
//     Canvas canvas,
//     Size size,
//     Paint paint,
//     Color color,
//   ) {
//     paint.color = color;
//     Path path = Path();

//     path.moveTo(0, 0);
//     path.quadraticBezierTo(
//       0,
//       size.height,
//       size.width / 3,
//       size.height / 3,
//     );

//     final offset = getOffset(path);
//     canvas.drawCircle(offset, 250, paint);
//   }
// }
