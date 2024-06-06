// /// Controller to manage user-related functionality.

import 'package:red_dot_entertainment/common/widgets/loaders/circular_loader.dart';
import 'package:red_dot_entertainment/data/repositories/authentication/authentication_repository.dart';
import 'package:red_dot_entertainment/data/repositories/user/user_repository.dart';
import 'package:red_dot_entertainment/features/personalization/models/user_model.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/full_screen_loader.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<UserModel> user = UserModel.empty().obs;
  final imageUploading = false.obs;
  final profileLoading = false.obs;
  final profileImageUrl = ''.obs;
  final hidePassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    // try {
    //   profileLoading.value = true;
    //   final user = await userRepository.fetchUserDetails();
    //   this.user(user);
    // } catch (e) {
    //   user(UserModel.empty());
    // } finally {
    //   profileLoading.value = false;
    // }
  }

  /// Save user Record from any Registration provider
  // Future<void> saveUserRecord(
  //     {UserModel? user, UserCredential? userCredentials}) async {
  //   try {
  //     // First UPDATE Rx User and then check if user data is already stored. If not store new data
  //     await fetchUserRecord();

  //     // If no record already stored.
  //     if (this.user.value.id.isEmpty) {
  //       if (userCredentials != null) {
  //         // Convert Name to First and Last Name
  //         final nameParts =
  //             UserModel.nameParts(userCredentials.user!.displayName ?? '');
  //         final customUsername = UserModel.generateUsername(
  //             userCredentials.user!.displayName ?? '');

  //         // Map data
  //         final newUser = UserModel(
  //           id: userCredentials.user!.uid,
  //           firstName: nameParts[0],
  //           lastName:
  //               nameParts.length > 1 ? nameParts.sublist(1).join(' ') : "",
  //           username: customUsername,
  //           email: userCredentials.user!.email ?? '',
  //           phoneNumber: userCredentials.user!.phoneNumber ?? '',
  //           profilePicture: userCredentials.user!.photoURL ?? '',
  //         );

  //         // Save user data
  //         await userRepository.saveUserRecord(newUser);

  //         // Assign new user to the RxUser so that we can use it through out the app.
  //         this.user(newUser);
  //       } else if (user != null) {
  //         // Save Model when user registers using Email and Password
  //         await userRepository.saveUserRecord(user);

  //         // Assign new user to the RxUser so that we can use it through out the app.
  //         this.user(user);
  //       }
  //     }
  //   } catch (e) {
  //     /// --- Show some Generic Error to the user --- ///
  //     ELoaders.showSnackBarError(
  //       title: EText.accountSavedError,
  //       message: EText.accountSavedErrorMessage,
  //     );
  //   }
}

//   /// Upload Profile Picture
uploadUserProfilePicture() async {
  // try {
  //   final image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: ESizes.uploadImageQuality,
  //       maxHeight: ESizes.uploadImageMaxHeight,
  //       maxWidth: ESizes.uploadImageMaxWidth);
  //   if (image != null) {
  //     /// --- Upload Image --- ///
  //     imageUploading.value = true;
  //     final uploadedImage = await userRepository.uploadImage(
  //         EText.dbUsersProfileImageDirectory, image);
  //     profileImageUrl.value = uploadedImage;

  //     /// --- Update User Image Record --- ///
  //     Map<String, dynamic> newImage = {
  //       EText.dbUsersProfilePicture: uploadedImage
  //     };
  //     await userRepository.updateSingleField(newImage);
  //     user.value.profilePicture = uploadedImage;
  //     user.refresh();

  //     imageUploading.value = false;
  //     ELoaders.showSnackBarSuccess(
  //         title: EText.congratulations,
  //         message: EText.uploadProfileImageSuccess);
  //   }
  // } catch (e) {
  //   imageUploading.value = false;
  //   ELoaders.showSnackBarError(title: EText.error, message: e.toString());
  // }
}

//   /// Delete Account Warning
void deleteAccountWarningPopup() {
  // Get.defaultDialog(
  //   contentPadding: const EdgeInsets.all(ESizes.md),
  //   title: EText.screenNameDeleteAccount,
  //   middleText: EText.deleteScreenText,
  //   confirm: ElevatedButton(
  //     onPressed: () async => deleteUserAccount(),
  //     style: ElevatedButton.styleFrom(
  //         backgroundColor: EColors.red,
  //         side: const BorderSide(color: EColors.red)),
  //     child: const Padding(
  //         padding: EdgeInsets.symmetric(horizontal: ESizes.lg),
  //         child: Text(EText.delete)),
  //   ),
  //   cancel: OutlinedButton(
  //     child: const Text(EText.cancel),
  //     onPressed: () => Navigator.of(Get.overlayContext!).pop(),
  //   ),
  // );
}

//   /// Delete User Account
void deleteUserAccount() async {
  // try {
  //   EFullScreenLoader.openLoadingDialog(
  //       EText.processing, EImages.animationDocer);

  //   /// First re-authenticate user
  //   final auth = AuthenticationRepository.instance;
  //   final provider =
  //       auth.baseUser!.providerData.map((e) => e.providerId).first;
  //   if (provider.isNotEmpty) {
  //     // Re Verify Auth Email
  //     if (provider == EText.authenticationProviderGoogle) {
  //       await auth.signInWithGoogle();
  //       await auth.deleteAccount();
  //       EFullScreenLoader.stopLoading();
  //       Get.offAll(() => const LoginScreen());
  //     } else if (provider == EText.authenticationProviderFacebook) {
  //       // await auth.signInWithFacebook();
  //       await auth.deleteAccount();
  //       EFullScreenLoader.stopLoading();
  //       Get.offAll(() => const LoginScreen());
  //     } else if (provider == EText.authenticationProviderPassword) {
  //       EFullScreenLoader.stopLoading();
  //       Get.to(() => const ReAuthLoginForm());
  //     }
  //   }
  // } catch (e) {
  //   EFullScreenLoader.stopLoading();
  //   ELoaders.showSnackBarError(title: EText.error, message: e.toString());
  // }
}

//   /// -- RE-AUTHENTICATE before deleting
Future<void> reAuthenticateEmailAndPasswordUser() async {
  // try {
  //   EFullScreenLoader.openLoadingDialog(
  //       EText.processing, EImages.animationDocer);

  //   //Check Internet
  //   // final isConnected = await NetworkManager.instance.isConnected();
  //   // if (!isConnected) {
  //   //   EFullScreenLoader.stopLoading();
  //   //   return;
  //   // }

  //   if (!reAuthFormKey.currentState!.validate()) {
  //     EFullScreenLoader.stopLoading();
  //     return;
  //   }

  //   await AuthenticationRepository.instance
  //       .reAuthenticateWithEmailAndPassword(
  //           verifyEmail.text.trim(), verifyPassword.text.trim());
  //   await AuthenticationRepository.instance.deleteAccount();
  //   EFullScreenLoader.stopLoading();
  //   Get.offAll(() => const LoginScreen());
  // } catch (e) {
  //   EFullScreenLoader.stopLoading();
  //   ELoaders.showSnackBarError(title: EText.error, message: e.toString());
  // }
}

//   /// Logout Loader Function
logout() {
  //   try {
  //     Get.defaultDialog(
  //       contentPadding: const EdgeInsets.all(ESizes.md),
  //       title: EText.screenNameLogout,
  //       middleText: EText.logoutScreenText,
  //       confirm: ElevatedButton(
  //         child: const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: ESizes.lg),
  //           child: Text(EText.confirm),
  //         ),
  //         onPressed: () async {
  //           onClose();

  //           /// On Confirmation show any loader until user Logged Out.
  //           Get.defaultDialog(
  //             title: '',
  //             barrierDismissible: false,
  //             backgroundColor: Colors.transparent,
  //             content: const ECircularLoader(),
  //           );
  //           await AuthenticationRepository.instance.logout();
  //         },
  //       ),
  //       cancel: OutlinedButton(
  //         child: const Text(EText.cancel),
  //         onPressed: () => Navigator.of(Get.overlayContext!).pop(),
  //       ),
  //     );
  //   } catch (e) {
  //     ELoaders.showSnackBarError(title: EText.error, message: e.toString());
  //   }
  // }
}
