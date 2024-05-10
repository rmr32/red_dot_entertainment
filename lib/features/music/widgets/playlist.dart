import 'package:red_dot_entertainment/features/music/controllers/playlist_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    final playlistController = PlaylistController.instance;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ECard(
      child: SizedBox(
        height:
            EDeviceUtils.getScreenWidth() > ESizes.mobile ? 320 : height * 0.3,
        width:
            EDeviceUtils.getScreenWidth() > ESizes.mobile ? 500 : width * 0.8,
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
                  height:
                      EDeviceUtils.getScreenWidth() > ESizes.mobile ? 120 : 50,
                  width:
                      EDeviceUtils.getScreenWidth() > ESizes.mobile ? 120 : 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),

              /// --- Song Name --- ///
              title: Text(
                songModel.songName,
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: EColors.secondary,
                          fontWeight: FontWeight.bold,
                        )
                    : Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: EColors.secondary,
                          fontWeight: FontWeight.bold,
                        ),
              ),

              /// --- Artist Name --- ///
              subtitle: Text(
                songModel.artistName,
                style: EDeviceUtils.getScreenWidth() > ESizes.mobile
                    ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: EColors.secondary,
                        )
                    : Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: EColors.secondary,
                        ),
              ),

              // trailing: Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     if (index == 1)
              //       ValueListenableBuilder<bool>(
              //         valueListenable: playlistController.isPlaying,
              //         builder: (BuildContext context, value, Widget? child) {
              //           return MiniMusicVisualizer(
              //             color: Colors.red,
              //             width: 4,
              //             height: 15,
              //             radius: 2,
              //             animate: value,
              //           );
              //         },
              //       ),
              //     IconButton(
              //       onPressed: () {},
              //       icon: const Icon(Icons.more_vert),
              //     )
              //   ],
              // ),
              /// --- On Tap --- ///
              onTap: () {
                playlistController.changeSong(index);
              },
            );
          },
        ),
      ),
    );
  }
}
