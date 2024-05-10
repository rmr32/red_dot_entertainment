import 'package:flutter/rendering.dart';
import 'package:red_dot_entertainment/common/controllers/navigation_controller.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class CustomScrollController extends GetxController {
  static CustomScrollController get instance => Get.find();

  final ScrollController _scrollController = ScrollController();
  final NavigationController _navController = Get.find();
  final RxDouble scrollPosition = 0.0.obs;
  // final GlobalKey targetKey = GlobalKey();
  final RxBool target = false.obs;

  /// --- Getters --- ///
  ScrollController get scrollController => _scrollController;

  @override
  void onInit() {
    // updateTextColor(scrollController.position, screenHeight)
    _updateScrollPosition();

    super.onInit();
  }

  void _updateScrollPosition() {
    _scrollController.addListener(_scrollListener);
    // scrollController.position.addListener((_scrollListener) {});
  }

  void _scrollListener() {
    // Check if the target key is visible on the screen
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isTargetKeyVisible()) {
        // Do something when scrolled to the target key
        print('Scrolled to the target key!');
      }
    });
    // Do something when scroll position changes
    scrollPosition.value = _scrollController.position.pixels;
    print('Scroll position: $scrollPosition');
  }

  bool isTargetKeyVisible() {
    // Get the render object of the target key
    RenderObject? renderObject =
        _navController.gallery.currentContext?.findRenderObject();
    if (renderObject != null) {
      // Get the bounding box of the target key
      final targetBoundingBox = renderObject.paintBounds;

      // Get the bounding box of the viewport
      final RenderAbstractViewport viewport =
          RenderAbstractViewport.of(renderObject);
      final viewportBoundingBox = viewport.paintBounds;

      // Check if the bounding boxes intersect
      return targetBoundingBox.intersect(viewportBoundingBox) != null;
    }
    return false;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
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
