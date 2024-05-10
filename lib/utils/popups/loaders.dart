import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';

import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers/helper_functions.dart';

class ELoaders {
  static void showForm(
      {String title = EText.name,
      bool isContactForm = false,
      String emailHint = EText.formHintEmail,
      String nameHint = EText.formHintName,
      String reasonHint = EText.formHintRequest,
      String buttonText = EText.buttonSubmit}) {
    showDialog(
      context: Get.context!,
      barrierColor: EColors.primary.withOpacity(EStyle.colorBlockOpacity),
      builder: (context) => Container(
        margin: EDeviceUtils.getScreenWidth() > ESizes.mobile
            ? EdgeInsets.symmetric(
                horizontal: EDeviceUtils.getScreenWidth() * 0.3,
                vertical: EDeviceUtils.getScreenHeight() * 0.2,
              )
            : EdgeInsets.symmetric(
                horizontal: EDeviceUtils.getScreenWidth() * 0.1,
                vertical: EDeviceUtils.getScreenHeight() * 0.2),
        decoration: BoxDecoration(
          color: EColors.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: EColors.secondary, width: 2),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  EImages.bg,
                  height: EDeviceUtils.getScreenHeight() * 1.2,
                  width: EDeviceUtils.getScreenWidth() * 1.2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // Opacity(
            //   opacity: 0.5,
            //   child: WidgetMask(
            //     blendMode: BlendMode.srcATop,
            //     childSaveLayer: true,
            //     mask: Image.asset(
            //       EImages.bg,
            //       fit: BoxFit.cover,
            //     ),
            //     child: Image.asset(
            //       EImages.logo,
            //       height: EDeviceUtils.getScreenHeight() * 1.2,
            //       fit: BoxFit.contain,
            //     ),
            //   ),
            // ),
            AlertDialog(
              insetPadding: const EdgeInsets.all(00),

              backgroundColor: Colors.transparent,
              title: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: EColors.secondary,
                          fontSize: ESizes.fontSizeHeadline,
                        ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    isContactForm
                        ? EText.formContactSubtitle
                        : 'Join our email list and recieve 20% off your first hour!',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: EColors.secondary,
                        ),
                  ),
                ],
              ),
              content: isContactForm
                  ? SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          TextField(
                            autofocus: true,
                            showCursor: true,
                            cursorColor: EColors.secondary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: EColors.secondary),
                            decoration: InputDecoration(
                              hintText: nameHint,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: EColors.secondary),
                              // labelText: 'Enter for a discount',
                              // labelStyle: Theme.of(context)
                              //     .textTheme
                              //     .bodyLarge!
                              //     .copyWith(color: EColors.secondary),
                            ),
                          ),
                          const SizedBox(height: ESizes.spaceBtwInputFields),
                          TextField(
                            showCursor: true,
                            cursorColor: EColors.secondary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: EColors.secondary),
                            decoration: InputDecoration(
                              hintText: emailHint,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: EColors.secondary),
                              // labelText: 'Enter for a discount',
                              // labelStyle: Theme.of(context)
                              //     .textTheme
                              //     .bodyLarge!
                              //     .copyWith(color: EColors.secondary),
                            ),
                          ),
                          const SizedBox(height: ESizes.spaceBtwInputFields),
                          TextField(
                            showCursor: true,
                            // expands: true,
                            minLines: 2,
                            maxLines: 2,
                            cursorColor: EColors.secondary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: EColors.secondary),
                            decoration: InputDecoration(
                              hintText: reasonHint,
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: EColors.secondary),
                              // labelText: 'Enter for a discount',
                              // labelStyle: Theme.of(context)
                              //     .textTheme
                              //     .bodyLarge!
                              //     .copyWith(color: EColors.secondary),
                            ),
                          ),
                        ],
                      ),
                    )
                  : TextField(
                      showCursor: true,
                      cursorColor: EColors.secondary,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: EColors.secondary),
                      decoration: InputDecoration(
                        hintText: emailHint,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: EColors.secondary),
                        // labelText: 'Enter for a discount',
                        // labelStyle: Theme.of(context)
                        //     .textTheme
                        //     .bodyLarge!
                        //     .copyWith(color: EColors.secondary),
                      ),
                    ),
              // actions: [TextButton(onPressed: null, child: Text(buttonText))],
              actions: [
                // const EHeroButton(),
                OnHoverButton(
                  controllerKey: '6',
                  text: buttonText,
                  onPressed: () {
                    Navigator.of(context).pop();
                    showSnackBarSuccess(
                        message: 'Your form has been submitted!');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void customForm(
      {String title = EText.name,
      String subTitle = '',
      Widget content = const SizedBox(),
      String buttonText = EText.buttonSubmit}) {
    showDialog(
      context: Get.context!,
      barrierColor: EColors.primary.withOpacity(EStyle.colorBlockOpacity),
      builder: (context) => Container(
        margin: EDeviceUtils.getScreenWidth() > ESizes.mobile
            ? EdgeInsets.symmetric(
                horizontal: EDeviceUtils.getScreenWidth() * 0.3,
                vertical: EDeviceUtils.getScreenHeight() * 0.2,
              )
            : EdgeInsets.symmetric(
                horizontal: EDeviceUtils.getScreenWidth() * 0.1,
                vertical: EDeviceUtils.getScreenHeight() * 0.2),
        decoration: BoxDecoration(
          color: EColors.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: EColors.secondary, width: 2),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  EImages.bg,
                  height: EDeviceUtils.getScreenHeight() * 1.2,
                  width: EDeviceUtils.getScreenWidth() * 1.2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: AlertDialog(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                insetPadding: const EdgeInsets.all(00),
                backgroundColor: Colors.transparent,
                content: SizedBox(
                    width: EDeviceUtils.getScreenWidth() > ESizes.mobile
                        ? EDeviceUtils.getScreenWidth() * 0.3
                        : EDeviceUtils.getScreenWidth() * 0.1,
                    child: content),
              ),
            ),
          ],
        ),
      ),
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
