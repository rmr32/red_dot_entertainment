import 'dart:io';

import 'package:red_dot_entertainment/utils/constants/exports.dart';

class EDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
    // final viewInsets = View.of(context).viewInsets;
    // return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static Size getScreenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double getScreenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double getScreenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static double getPixelRatio() {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight() {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getKeybordHeight() {
    final viewInsets = MediaQuery.of(Get.context!).viewInsets;
    return viewInsets.bottom;
  }

  static Future<bool> isKeyboardVisible() async {
    final viewInsets = View.of(Get.context!).viewInsets;
    return viewInsets.bottom > 0;
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(
      List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


// // give the current args from currentScreen
// Get.arguments

// // give name of previous route
// Get.previousRoute

// // give the raw route to access for example, rawRoute.isFirst()
// Get.rawRoute

// // give access to Routing API from GetObserver
// Get.routing

// // check if snackbar is open
// Get.isSnackbarOpen

// // check if dialog is open
// Get.isDialogOpen

// // check if bottomsheet is open
// Get.isBottomSheetOpen

// // remove one route.
// Get.removeRoute()

// // back repeatedly until the predicate returns true.
// Get.until()

// // go to next route and remove all the previous routes until the predicate returns true.
// Get.offUntil()

// // go to next named route and remove all the previous routes until the predicate returns true.
// Get.offNamedUntil()

// //Check in what platform the app is running
// GetPlatform.isAndroid
// GetPlatform.isIOS
// GetPlatform.isMacOS
// GetPlatform.isWindows
// GetPlatform.isLinux
// GetPlatform.isFuchsia

// //Check the device type
// GetPlatform.isMobile
// GetPlatform.isDesktop
// //All platforms are supported independently in web!
// //You can tell if you are running inside a browser
// //on Windows, iOS, OSX, Android, etc.
// GetPlatform.isWeb

// // Equivalent to : MediaQuery.of(context).size.height,
// // but immutable.
// Get.height
// Get.width

// // Gives the current context of the Navigator.
// Get.context

// // Gives the context of the snackbar/dialog/bottomsheet in the foreground, anywhere in your code.
// Get.contextOverlay

// // Note: the following methods are extensions on context. Since you
// // have access to context in any place of your UI, you can use it anywhere in the UI code

// // If you need a changeable height/width (like Desktop or browser windows that can be scaled) you will need to use context.
// context.width
// context.height

// // Gives you the power to define half the screen, a third of it and so on.
// // Useful for responsive applications.
// // param dividedBy (double) optional - default: 1
// // param reducedBy (double) optional - default: 0
// context.heightTransformer()
// context.widthTransformer()

// /// Similar to MediaQuery.of(context).size
// context.mediaQuerySize()

// /// Similar to MediaQuery.of(context).padding
// context.mediaQueryPadding()

// /// Similar to MediaQuery.of(context).viewPadding
// context.mediaQueryViewPadding()

// /// Similar to MediaQuery.of(context).viewInsets;
// context.mediaQueryViewInsets()

// /// Similar to MediaQuery.of(context).orientation;
// context.orientation()

// /// Check if device is on landscape mode
// context.isLandscape()

// /// Check if device is on portrait mode
// context.isPortrait()

// /// Similar to MediaQuery.of(context).devicePixelRatio;
// context.devicePixelRatio()

// /// Similar to MediaQuery.of(context).textScaleFactor;
// context.textScaleFactor()

// /// Get the shortestSide from screen
// context.mediaQueryShortestSide()

// /// True if width be larger than 800
// context.showNavbar()

// /// True if the shortestSide is smaller than 600p
// context.isPhone()

// /// True if the shortestSide is largest than 600p
// context.isSmallTablet()

// /// True if the shortestSide is largest than 720p
// context.isLargeTablet()

// /// True if the current device is Tablet
// context.isTablet()

// /// Returns a value<T> according to the screen size
// /// can give value for:
// /// watch: if the shortestSide is smaller than 300
// /// mobile: if the shortestSide is smaller than 600
// /// tablet: if the shortestSide is smaller than 1200
// /// desktop: if width is largest than 1200
// context.responsiveValue<T>()