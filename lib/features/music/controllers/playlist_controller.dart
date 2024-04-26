import 'package:audioplayers/audioplayers.dart';
import 'package:red_dot_entertainment/features/music/models/song_model.dart';
import 'package:red_dot_entertainment/utils/constants/audio.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/device/device_utility.dart';

class PlaylistController extends GetxController {
  static PlaylistController get instance => Get.find();

  // final AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer audioPlayer = AudioPlayer();
  final RxBool isPlaying = false.obs;
  final RxBool isLoopMode = false.obs;
  final Rx<Duration> currentDuration = Duration.zero.obs;
  final Rx<Duration> totalDuration = Duration.zero.obs;

  /// --- Initial Current Song --- ///
  final RxInt currentSong = 0.obs;

  /// --- Getters --- ///
  // List<SongModel> get playlist => playlist;
  // RxInt get currentSong => currentSong;
  // RxBool get isPlaying => _isPlaying;
  // RxBool get isLoopMode => _isLoopMode;
  // Rx<Duration> get currentDuration => currentDuration;
  // Rx<Duration> get totalDuration => _totalDuration;

  @override
  void onInit() async {
    super.onInit();
    currentSong.value = 0;

    await audioPlayer.setSourceAsset(playlist[currentSong.toInt()].audio);

    listenToDuration();
  }

  void listenToDuration() {
    audioPlayer.onDurationChanged.listen((Duration newDuration) {
      totalDuration.value = newDuration;
    });

    audioPlayer.onPositionChanged.listen((Duration newPosition) {
      currentDuration.value = newPosition;
    });

    audioPlayer.onPlayerComplete.listen((event) {
      if (isLoopMode.value) {
        play();
      } else {
        playNextSong();
      }
    });
  }

  /// --- Playlist --- ///
  final List<SongModel> playlist = [
    SongModel(
      songName: EText.audioBlocBoy,
      artistName: EText.audioJD,
      albumArt: EImages.playlistBlocBoy,
      audio: EAudio.blockBoy,
    ),
    SongModel(
      songName: EText.audioLilDurkLilBaby,
      artistName: EText.audioJD,
      albumArt: EImages.playlistLilDurkLilBaby,
      audio: EAudio.lilDurkLilBaby,
    ),
    SongModel(
      songName: EText.audioRoddyRicch,
      artistName: EText.audioJD,
      albumArt: EImages.playlistRoddyRicch,
      audio: EAudio.roddyRicch,
    ),
    SongModel(
      songName: EText.audioFuture,
      artistName: EText.audioJD,
      albumArt: EImages.playlistFuture,
      audio: EAudio.future,
    ),
    SongModel(
      songName: EText.audioCeo,
      artistName: EText.audioJD,
      albumArt: EImages.playlistCeo,
      audio: EAudio.ceo,
    ),
    SongModel(
      songName: EText.audioSir,
      artistName: EText.audioJD,
      albumArt: EImages.playlistSir,
      audio: EAudio.sir,
    )
  ];

  /// --- Change Song --- ///
  void changeSong(int index) {
    currentSong.value = index;
    play();
  }

  /// --- Play Song --- ///
  Future<void> play() async {
    //   // await player.setSource(AssetSource('sounds/coin.wav'));
    //   // await player.setVolume(0.5);
    //   // await player.setPlaybackRate(0.5); // half speed
    await audioPlayer.stop();
    final String path = playlist[currentSong.toInt()].audio;

    await audioPlayer.play(AssetSource(path));
    isPlaying.value = true;

    // try {
    //   final String path = playlist[currentSong.toInt()].audio;
    //   print('Playing audio from: $path');

    //   await audioPlayer.play(AssetSource(path));
    //   isPlaying.value = true;
    // } catch (e) {
    //   print('Error playing audio: $e');
    //   isPlaying.value = false;
    // }
  }

  /// --- Stop Song --- ///
  void stop() async {
    await audioPlayer.stop();
    currentDuration.value = Duration.zero;
    isPlaying.value = false;
  }

  /// --- Pause Song --- ///
  void pause() async {
    await audioPlayer.pause();

    isPlaying.value = false;
  }

  /// --- Resume Song --- ///
  void resume() async {
    await audioPlayer.resume();

    isPlaying.value = true;
  }

  /// --- Calls Pause or Resume --- ///
  void pauseOrResume() async {
    if (isPlaying.value) {
      pause();
    } else {
      resume();
    }
  }

  /// --- Seek Position --- ///
  void seek(Duration position) async {
    await audioPlayer.seek(position);
  }

  /// --- Play Next Song --- ///
  void playNextSong() {
    if (currentSong < playlist.length - 1) {
      currentSong.value = currentSong.value + 1;
    } else {
      currentSong.value = 0;
    }
    play();
  }

  /// --- Play Previous Song --- ///
  void playPreviousSong() {
    if (currentDuration.value.inSeconds > 3) {
    } else {
      if (currentSong > 0) {
        currentSong.value = currentSong.value - 1;
      } else {
        currentSong.value = playlist.length - 1;
      }
    }
    play();
  }

  /// --- Shuffle --- ///
  void shuffle() async {
    // await _audioPlayer.
  }

  /// --- Repeat --- ///
  void loop() {
    if (isLoopMode.value) {
      isLoopMode.value = false;
    } else {
      isLoopMode.value = true;
    }
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }
}
