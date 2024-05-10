import 'package:get/get.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class CustomScrollController extends GetxController {
  static CustomScrollController get instance => Get.find();

  RxBool scrollUp = true.obs;
  var currentPage = 0.obs;
  RxDouble previous = 0.0.obs;

  @override
  void onInit() {
    //    audioPlayer.onDurationChanged.listen((Duration newDuration) {
    //   totalDuration.value = newDuration;
    // });

    super.onInit();
  }

  void scrollingUp(double value) {
    if (previous <= value) {
      scrollUp.value = true;
    } else {
      scrollUp.value = false;
    }
  }
}
