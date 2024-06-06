import 'package:red_dot_entertainment/data/repositories/authentication/authentication_repository.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// --- Sends Email Whenever Verify Screen Appears --- ///
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// --- Sends Email Verification Link --- ///
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ELoaders.showSnackBarSuccess(
          title: EText.authPasswordSent,
          message: EText.authPasswordSentVerifyMessage);
    } catch (e) {
      ELoaders.showSnackBarError(title: EText.error, message: e.toString());
    }
  }

  /// --- Timer to Automatically Redirect on Email Verification --- ///
  setTimerForAutoRedirect() {
    // Timer.periodic(const Duration(seconds: 2), (timer) async {
    //   await FirebaseAuth.instance.currentUser?.reload();
    //   final user = FirebaseAuth.instance.currentUser;
    //   if (user?.emailVerified ?? false) {
    //     timer.cancel();
    //     Get.off(
    //       () => SuccessScreen(
    //         image: EImages.animationSuccessfulAnimation,
    //         title: EText.yourAccountCreatedTitle,
    //         subTitle: EText.yourAccountCreatedSubitle,
    //         onPressed: () => AuthenticationRepository.instance
    //             .screenRedirect(FirebaseAuth.instance.currentUser),
    //       ),
    //     );
    //   }
    // });
  }

  /// --- Manually Check if Email Verified --- ///
  checkEmailVerificationStatus() async {
    //   final currentUser = FirebaseAuth.instance.currentUser;
    //   if (currentUser != null && currentUser.emailVerified) {
    //     Get.off(
    //       () => SuccessScreen(
    //         image: EImages.animationSuccessfulAnimation,
    //         title: EText.yourAccountCreatedTitle,
    //         subTitle: EText.yourAccountCreatedSubitle,
    //         onPressed: () => AuthenticationRepository.instance
    //             .screenRedirect(FirebaseAuth.instance.currentUser),
    //       ),
    //     );
    //   }
    // }
  }
}
