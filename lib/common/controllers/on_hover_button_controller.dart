import 'package:red_dot_entertainment/utils/constants/exports.dart';

class OnHoverButtonController extends GetxController {
  static OnHoverButtonController get instance => Get.find();
  var isHovered = <String, RxBool>{
    EText.instagram: false.obs,
    EText.youtube: false.obs,
    EText.twitch: false.obs,
    EText.newsletter: false.obs,
    '1': false.obs,
    '2': false.obs,
    '3': false.obs,
    '4': false.obs,
    '5': false.obs,
    '6': false.obs,
  };

  void onEnter(String buttonKey) {
    isHovered[buttonKey]?.value = true;
    print('$buttonKey is hovered');
    print(isHovered[buttonKey]?.value);
  }

  void onExit(String buttonKey) {
    isHovered[buttonKey]?.value = false;
    print(isHovered[buttonKey]?.value);
  }
}
