import 'package:red_dot_entertainment/data/repositories/authentication/authentication_repository.dart';
import 'package:red_dot_entertainment/data/repositories/user/user_repository.dart';
import 'package:red_dot_entertainment/features/authentication/screens/signup/verify_email.dart';
import 'package:red_dot_entertainment/features/personalization/models/user_model.dart';
import 'package:red_dot_entertainment/utils/constants/animations.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/full_screen_loader.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// --- Variables --- ///
  final isLoading = false.obs; // Observable for loading state
  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  /// --- SIGNUP --- ///
  void signup() async {
    try {
      /// --- SHOW LOADING SCREEN --- ///
      isLoading.value = true;
      EFullScreenLoader.openLoadingDialog(
          EText.processingInformation, EAnimate.loadingInformation);

      /// --- Check Internet Connection --- ///
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   isLoading.value = false;

      //   /// --- Remove Loader --- ///
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      /// --- CHECK FORM VALIDATION --- ///
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;

        /// --- REMOVE LOADER SCREEN --- ///
        EFullScreenLoader.stopLoading();
        return;
      }

      /// --- CHECK PRIVACY POLICY --- ///
      if (!privacyPolicy.value) {
        /// --- REMOVE LOADER SCREEN --- ///
        EFullScreenLoader.stopLoading();
        ELoaders.showSnackBarWarning(
            title: EText.authPrivacyPolicyAccept,
            message: EText.authPrivacyPolicyAcceptMessage);
        return;
      }

      /// --- CREATE USER IN DATABASE --- ///
      final userCredential = await AuthenticationRepository.instance
          .createAccountWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
        // firstName.text.trim(),
        // lastName.text.trim(),
        // password.text.trim(),
      );

      /// --- Save Authenticated user data in the Firebase Firestore --- ///
      //   final newUser = UserModel(
      //     id: userCredential.user!.uid,
      //     firstName: firstName.text.trim(),
      //     lastName: lastName.text.trim(),
      //     username: username.text.trim(),
      //     email: email.text.trim(),
      //     phoneNumber: phoneNumber.text.trim(),
      //     profilePicture: '',
      //   );

      //   final userRepository = Get.put(UserRepository());
      //   await userRepository.saveUserRecord(newUser);

      /// --- REMOVE LOADER SCREEN --- ///
      EFullScreenLoader.stopLoading();

      /// --- SHOW SUCCESS MESSAGE --- ///
      ELoaders.showSnackBarSuccess(
          title: EText.success, message: EText.authAccountCreated);

      //   /// --- Move to Verify Email Screen --- ///
      Navigator.of(Get.context!).pop();

      // Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      isLoading.value = false;

      /// --- REMOVE LOADER SCREEN --- ///
      EFullScreenLoader.stopLoading();

      /// --- SHOW ERROR MESSAGE TO USER --- ///
      ELoaders.showSnackBarError(title: EText.error, message: e.toString());
    }
  }
}
