import 'package:red_dot_entertainment/common/widgets/icons/on_hover_icon.dart';
import 'package:red_dot_entertainment/features/music/controllers/playlist_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/helper_functions.dart';

class PlayControls extends StatelessWidget {
  const PlayControls({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ECard(
      child: SizedBox(
        width: width > ESizes.mobile ? 500 : width * 0.8,
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
                            .playlist[playlistController.currentSong.value]
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
                        left: 2, right: 2, top: 12, bottom: 12)
                    : const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                          mainAxisAlignment: width < ESizes.mobile
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.spaceBetween,
                          children: [
                            /// --- Artist Name --- ///
                            width > ESizes.mobile
                                ? Obx(
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
                                  )
                                : const SizedBox.shrink(),

                            /// --- Song Title --- ///
                            Obx(
                              () => Text(
                                playlistController
                                    .playlist[
                                        playlistController.currentSong.value]
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
                              left: 15, right: 15, top: 10, bottom: 0)
                          : const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Text(
                              EHelperFunctions.getFormattedTime(
                                      playlistController.currentDuration.value)
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
                                playlistController
                                    .seek(Duration(seconds: value.toInt()));
                              },
                              onChangeEnd: (double value) {
                                playlistController
                                    .seek(Duration(seconds: value.toInt()));
                              },
                            ),
                          ),
                          Obx(() => Text(
                              EHelperFunctions.getFormattedTime(
                                      playlistController.totalDuration.value)
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
                      mainAxisAlignment: width < ESizes.mobile
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        /// --- PREVIOUS --- ///
                        OnHoverIcon(
                          isSmall: width > ESizes.mobile ? false : true,
                          icon: EIcons.previous,
                          controllerKey: '2',
                          onPressed: () {
                            playlistController.playPreviousSong();
                          },
                        ),

                        /// --- PLAY / PAUSE --- ///
                        Obx(
                          () => OnHoverIcon(
                            isSmall: width > ESizes.mobile ? false : true,
                            icon: playlistController.isPlaying.value
                                ? EIcons.pause
                                : EIcons.play,
                            controllerKey: '3',
                            onPressed: () {
                              playlistController.pauseOrResume();
                            },
                          ),
                        ),

                        /// --- NEXT --- ///
                        OnHoverIcon(
                          isSmall: width > ESizes.mobile ? false : true,
                          icon: EIcons.next,
                          controllerKey: '4',
                          onPressed: () {
                            playlistController.playNextSong();
                          },
                        ),

                        /// ---  REPEAT --- ///
                        Obx(
                          () => OnHoverIcon(
                            isSmall: width > ESizes.mobile ? false : true,
                            color: playlistController.isLoopMode.value
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
    );
  }
}
