import 'package:red_dot_entertainment/utils/constants/exports.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();

  GlobalKey home = GlobalKey();
  GlobalKey about = GlobalKey();
  GlobalKey gallery = GlobalKey();
  GlobalKey music = GlobalKey();
  GlobalKey store = GlobalKey();
  GlobalKey contact = GlobalKey();
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }

  void scrollPage(int index) {
    Scrollable.ensureVisible(
      index == 0
          ? home.currentContext!
          : index == 1
              ? about.currentContext!
              : index == 3
                  ? music.currentContext!
                  : index == 4
                      ? gallery.currentContext!
                      : contact.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.5,
    );
  }
}

    // EText.home: 0,
    // EText.about: 1,
    // EText.price: 2,
    // EText.beats: 3,
    // EText.gallery: 4,
    // EText.book: 5,