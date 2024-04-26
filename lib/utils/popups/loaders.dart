import 'package:red_dot_entertainment/common/widgets/buttons/on_hover_button.dart';
import 'package:red_dot_entertainment/features/home/widgets/hero_buttons.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';

class ELoaders {
  static void showForm(
      {String title = EText.name,
      String hint = EText.formHintEmail,
      String buttonText = EText.buttonSubmit}) {
    showDialog(
      context: Get.context!,
      barrierColor: EColors.primary.withOpacity(EStyle.colorBlockOpacity),
      builder: (context) => Container(
        // color: EColors.primary.withOpacity(0.3),
        margin: const EdgeInsets.all(200),
        decoration: BoxDecoration(
          color: EColors.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: EColors.secondary, width: 2),
        ),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(00),
          // contentPadding: const EdgeInsets.all(200),
          // backgroundColor: EColors.primary.withOpacity(0.7),
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: EColors.secondary,
                  fontSize: ESizes.fontSizeHeadline,
                ),
          ),
          content: TextField(
            showCursor: true,
            cursorColor: EColors.secondary,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: EColors.secondary),
            decoration: InputDecoration(
              hintText: hint,
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
            const EHeroButton(),
            OnHoverButton(
              controllerKey: '6',
              text: buttonText,
              onPressed: () => Navigator.of(context).pop(),
            )
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
        elevation: elevation,
        duration: Duration(seconds: duration),
        backgroundColor: Colors.transparent,
        content: Container(
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

  static showSnackBarSuccess({required title, message = ' ', duration = 5}) {
    Get.snackbar(
      title,
      message,
      isDismissible: false,
      shouldIconPulse: true,
      colorText: EColors.textPrimary,
      backgroundColor: EColors.accent,
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
