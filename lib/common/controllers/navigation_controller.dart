import 'package:red_dot_entertainment/utils/constants/exports.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}
