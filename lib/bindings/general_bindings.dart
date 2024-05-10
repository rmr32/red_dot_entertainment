import 'package:get/get.dart';
import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/common/controllers/on_hover_button_controller.dart';
import 'package:red_dot_entertainment/common/controllers/scroll_controller.dart';
import 'package:red_dot_entertainment/features/music/controllers/playlist_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Core --- ///
    // Get.put(NetworkManager());

    // /// -- Product --- ///
    // Get.put(CheckoutController());
    // Get.put(VariationController());
    // Get.put(ImagesController());

    // /// -- Other --- ///
    // Get.put(AddressController());

    /// --- UI/UX Elements --- ///
    // Get.put(SizeController());
    Get.put(OnHoverButtonController());
    Get.put(NavigationController());
    Get.put(CustomScrollController());

    // Get.put(HeightController());
    Get.put(PlaylistController());
    // Get.put(VideoController());
  }
}
