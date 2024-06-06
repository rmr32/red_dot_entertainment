import 'package:red_dot_entertainment/utils/constants/exports.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  // final CustomScrollController scrollController = Get.find();

  GlobalKey home = GlobalKey();
  GlobalKey about = GlobalKey();
  GlobalKey gallery = GlobalKey();
  GlobalKey music = GlobalKey();
  GlobalKey store = GlobalKey();
  GlobalKey contact = GlobalKey();
  // RxDouble targetTop = 0.0.obs;

  late final List<GlobalKey> targetKeys = [
    home,
    about,
    gallery,
    music,
    store,
    contact,
  ];
  final RxList<double> widgetOffsets = <double>[].obs;

  var currentPage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getGlobalKeyOffset();
    // changePage();
  }

  // void getGlobalKeyOffset() {
  //   for (GlobalKey key in targetKeys) {
  //     RenderBox? renderObject =
  //         key.currentContext?.findRenderObject() as RenderBox;
  //     Offset targetOffset = renderObject.localToGlobal(Offset.zero);
  //     double targetTop =
  //         (targetOffset.dy - 0); // If using appbar, subtract appbar height
  //     widgetOffsets.add(targetTop);
  //     print(widgetOffsets);
  //   }
  // }

  // void changePage() {
  //   double scrollPosition = scrollController.scrollPosition.toDouble();
  //   if (scrollPosition >= widgetOffsets[1] &&
  //       scrollPosition < widgetOffsets[2]) {
  //     currentPage = 1.obs;
  //   } else {
  //     currentPage = 2.obs;
  //   }
  // }

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