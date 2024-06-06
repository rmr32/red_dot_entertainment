import 'package:red_dot_entertainment/data/repositories/authentication/authentication_repository.dart';
import 'package:red_dot_entertainment/features/authentication/screens/signup/signup.dart';
import 'package:red_dot_entertainment/features/personalization/controllers/user_controller.dart';
import 'package:red_dot_entertainment/utils/constants/animations.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/full_screen_loader.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// --- Variables --- ///
  final isLoading = false.obs;
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  // final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // email.text = localStorage.read(EText.dbLocalRememberMeEmail) ?? '';
    // password.text = localStorage.read(EText.dbLocalRememberMePassword) ?? '';
    super.onInit();
  }

  /// -- LOGIN --- ///
  Future<void> emailAndPasswordSignIn() async {
    try {
      /// --- SHOW LOADING SCREEN --- ///
      isLoading.value = true;
      EFullScreenLoader.openLoadingDialog(
          EText.authAccountLogingIn, EAnimate.docer);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   isLoading.value = false;
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      /// --- CHECK FORM VALIDATION --- ///
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        EFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      // if (rememberMe.value) {
      //   localStorage.write(EText.dbLocalRememberMeEmail, email.text.trim());
      //   localStorage.write(
      //       EText.dbLocalRememberMePassword, password.text.trim());
      // }
      // TODO: Add 'Forget Data if Remember Me is Not Selected

      // LOGIN USER
      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      // Assign user data to RxUser of UserController to use in app
      // await userController.fetchUserRecord();

      /// --- REMOVE LOADER SCREEN --- ///
      EFullScreenLoader.stopLoading();

      /// --- SHOW SUCCESS MESSAGE --- ///
      ELoaders.showSnackBarSuccess(
          title: EText.success, message: EText.authAccountCreated);

      /// --- REDIRECT AFTER LOGIN --- ///
      // await AuthenticationRepository.instance
      //     .screenRedirect(userCredentials.user);
      Get.to(() => const SignupScreen());
    } catch (e) {
      isLoading.value = false;
      EFullScreenLoader.stopLoading();

      /// --- Show some Generic Error to the user --- ///
      ELoaders.showSnackBarError(title: EText.error, message: e.toString());
    }
  }

  /// --- Google SignIn Authentication --- ///
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      EFullScreenLoader.openLoadingDialog(
          EText.authAccountLogingIn, EAnimate.docer);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      // Google Authentication
      // final userCredentials =
      //     await AuthenticationRepository.instance.signInWithGoogle();

      // Save Authenticated user data in the Firebase Firestore
      // await userController.saveUserRecord(userCredentials: userCredentials);

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      // await AuthenticationRepository.instance
      //     .screenRedirect(userCredentials?.user);
    } catch (e) {
      EFullScreenLoader.stopLoading();

      /// --- Show some Generic Error to the user --- ///
      ELoaders.showSnackBarError(title: EText.error, message: e.toString());
    }
  }

  /// Facebook SignIn Authentication
  Future<void> facebookSignIn() async {
    try {
      // Start Loading
      EFullScreenLoader.openLoadingDialog(
          EText.authAccountLogingIn, EAnimate.docer);

      // Check Internet Connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   EFullScreenLoader.stopLoading();
      //   return;
      // }

      // Facebook Authentication
      // final userCredentials =
      //     await AuthenticationRepository.instance.signInWithFacebook();

      // Save Authenticated user data in the Firebase Firestore
      // await userController.saveUserRecord(userCredentials: userCredentials);

      // Remove Loader
      EFullScreenLoader.stopLoading();

      // Redirect
      // await AuthenticationRepository.instance
      //     .screenRedirect(userCredentials.user);
    } catch (e) {
      EFullScreenLoader.stopLoading();

      /// --- Show some Generic Error to the user --- ///
      ELoaders.showSnackBarError(title: EText.error, message: e.toString());
    }
  }
}
