import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/common/widgets/dialogs/dialog.dart';
import 'package:red_dot_entertainment/features/about/widgets/glass.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/helper_functions.dart';

class ELoaders {
  static void customDialog({
    Widget child = const SizedBox(),
  }) {
    showDialog(
      context: Get.context!,
      barrierColor: EColors.primary.withOpacity(EStyle.colorBlockOpacity),
      builder: (context) {
        final dialog = EDialog(
          child: child,
        );
        // final showFullScreenDialog =
        //     EDeviceUtils.getScreenWidth() < ESizes.mobile;
        // if (showFullScreenDialog) {
        //   return Dialog.fullscreen(child: form);
        // } else {
        // return Dialog(child: form);
        // }
        return dialog;
      },
    );
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static showSnackBarCustom({required message, elevation = 0.0, duration = 3}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: elevation,
        duration: Duration(seconds: duration),
        backgroundColor: Colors.transparent,
        content: Container(
          width: EDeviceUtils.getScreenWidth() * 0.8,
          padding: const EdgeInsets.all(ESizes.md),
          margin: const EdgeInsets.symmetric(horizontal: ESizes.lg),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ESizes.borderRadiusMd),
            color: EHelperFunctions.isDarkMode(Get.context!)
                ? EColors.greyDark.withOpacity(0.9)
                : EColors.grey.withOpacity(0.9),
          ),
          child: Center(
              child: Text(message,
                  style: Theme.of(Get.context!).textTheme.labelLarge)),
        ),
      ),
    );
  }

  static showSnackBarSuccess({title = 'Success', message = '', duration = 5}) {
    Get.snackbar(
      title,
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: EColors.textPrimary,
      backgroundColor: EColors.secondary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(ESizes.md),
      icon: const Icon(
        EImages.iconSuccess,
        color: EColors.primary,
      ),
    );
  }

  static showSnackBarWarning({required title, message = ' ', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.textWhite,
      backgroundColor: EColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(ESizes.md),
      icon: const Icon(
        EImages.iconWarning,
        color: EColors.white,
      ),
    );
  }

  static showSnackBarError({required title, message = ' ', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: EColors.textWhite,
      backgroundColor: EColors.error,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(ESizes.md),
      icon: const Icon(
        EImages.iconError,
        color: EColors.white,
      ),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
