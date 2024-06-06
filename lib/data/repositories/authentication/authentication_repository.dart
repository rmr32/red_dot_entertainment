import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/exceptions/base_auth_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// --- VARIABLES --- ///
  // final deviceStorage = GetStorage();

  final SupabaseClient _auth = Supabase.instance.client;

  late final Rx<User?> _baseUser;
  late final Rx<Session?> _baseSession;
  var isAuthenticated = false.obs;

  /// --- GETTERS --- ///
  // User? get authUser => _auth.currentUser;
  User? get baseUser => _baseUser.value;
  // String get getUserID => _baseUser.value?.uid ?? "";
  String get getUserEmail => _baseUser.value?.email ?? "";
  // String get getDisplayName => _baseUser.value?.displayName ?? "";
  // String get getPhoneNo => _baseUser.value?.phoneNumber ?? "";

  /// --- Called from main.dart on app launch --- ///
  @override
  void onReady() {
    _authListener();
    // _baseUser = Rx<User?>(_auth.currentUser);
    // _baseUser.bindStream(_auth.userChanges());
    // FlutterNativeSplash.remove();
    // screenRedirect(_baseUser.value);
  }

  void _authListener() {
    // _auth.auth.onAuthStateChange.listen((data) {
    //   final AuthChangeEvent event = data.event;
    //   _baseSession.value = data.session;
    // });
  }

  /// --- Fuction to Show Relevant screen --- ///
  screenRedirect(User? user) async {
    // final user = _auth.currentUser;
    // if (user != null) {
    //   if (user.emailVerified) {
    //     await ELocalStorage.init(user.uid);
    //     Get.offAll(() => const ENavigationMenu());
    //   } else {
    //     Get.offAll(() => VerifyEmailScreen(email: getUserEmail));
    //   }
    // } else {
    //   // Local Storage: User is new or Logged out! If new then write isFirstTime Local storage variable = true.
    //   /// --- Local Storage --- ///
    //   if (kDebugMode) {
    //     print('============== GET STORAGE AUTH PAGE =============');
    //     print(deviceStorage.read(EText.dbLocalFirstTime));
    //   }

    //   deviceStorage.writeIfNull(EText.dbLocalFirstTime, true);

    //   /// --- Check if it's First Time Launching App
    //   deviceStorage.read(EText.dbLocalFirstTime) != true
    //       ? Get.offAll(() => const LoginScreen())
    //       : Get.offAll(() => const OnBoardingScreen());
    // }
  }

  /// --- EMAIL & PASSWORD SIGN-IN --- ///
  ///
  ///

  /// --- [EmailAuthentication] - SignIn --- ///

  Future<AuthResponse> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      // AuthResponse authResponse = _res.value;
      final response =
          await _auth.auth.signInWithPassword(email: email, password: password);
      // _baseSession.value = response.session;
      // _baseUser.value = response.user;
      isAuthenticated.value = true;
      return response;
    } on AuthException catch (e) {
      throw EBaseAuthException(e.toString()).message;
    } catch (e) {
      throw EText.errorLong;
    }
  }
  // Future<UserCredential> loginWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw EBaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw EBaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const EFormatException();
  //   } on PlatformException catch (e) {
  //     throw EPlatformException(e.code).message;
  //   } catch (e) {
  //     throw EText.errorLong;
  //   }
  // }

  /// --- [EmailAuthentication] - CREATE ACCOUNT --- ///

  Future<AuthResponse> createAccountWithEmailAndPassword(
    String email,
    String password,
    // String firstName,
    // String lastName,
    // String phoneNumber,
  ) async {
    try {
      // AuthResponse authResponse = _res.value;
      final response = await _auth.auth.signUp(
        email: email,
        password: password,
        // data: {
        //   'first_name': firstName,
        //   'last_name': lastName,
        //   'phone_number': phoneNumber,
        // },
      );

      // _baseSession.value = response.session;
      // _baseUser.value = response.user;
      isAuthenticated.value = true;
      return response;
    } on AuthException catch (e) {
      print('ERROR AUTH ERROR');
      print(e);
      throw EBaseAuthException(e.message);
    } catch (e) {
      print('ERROR ERROR ERROR');
      print(e);
      throw EText.errorLong;
    }
  }

  /// --- [ReAuthenticate] - ReAuthenticate User --- ///
  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    // try {
    //   /// --- Create a Credential --- ///
    //   AuthCredential credential =
    //       EmailAuthProvider.credential(email: email, password: password);

    //   /// --- ReAuthenticate --- ///
    //   await _auth.currentUser!.reauthenticateWithCredential(credential);
    // } on FirebaseAuthException catch (e) {
    //   throw EBaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw EBaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const EFormatException();
    // } on PlatformException catch (e) {
    //   throw EPlatformException(e.code).message;
    // } catch (e) {
    //   throw EText.errorLong;
    // }
  }

  /// --- [EmailVerification] - MAIL VERIFICATION --- ///
  Future<void> sendEmailVerification() async {
    // try {
    //   await _auth.currentUser?.sendEmailVerification();
    // } on FirebaseAuthException catch (e) {
    //   throw EBaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw EBaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const EFormatException();
    // } on PlatformException catch (e) {
    //   throw EPlatformException(e.code).message;
    // } catch (e) {
    //   throw EText.errorLong;
    // }
  }

  /// --- [EmailAuthentication] - FORGOT PASSWORD --- ///
  Future<void> sendPasswordResetEmail(email) async {
    // try {
    //   await _auth.sendPasswordResetEmail(email: email);
    // } on FirebaseAuthException catch (e) {
    //   throw EBaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw EBaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const EFormatException();
    // } on PlatformException catch (e) {
    //   throw EPlatformException(e.code).message;
    // } catch (e) {
    //   throw EText.errorLong;
    // }
  }

  /// ------------------------------------------------------------------ ///
  /// --- FEDERATED IDENTITY & SOCIAL SIGN-IN --- ///
  ///
  ///

  /// --- [GoogleAuthentication] - GOOGLE --- ///
  // Future<UserCredential?> signInWithGoogle() async {
  // try {
  //   // --- Trigger the authentication flow --- ///
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // --- Obtain the auth details from the request --- ///
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // --- Create a new credential --- ///
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await _auth.signInWithCredential(credential);
  // } on FirebaseAuthException catch (e) {
  //   throw EBaseAuthException(e.code).message;
  // } on FirebaseException catch (e) {
  //   throw EBaseException(e.code).message;
  // } on FormatException catch (_) {
  //   throw const EFormatException();
  // } on PlatformException catch (e) {
  //   throw EPlatformException(e.code).message;
  // } catch (e) {
  //   throw EText.errorLong;
  // }
  // }

  /// --- [FacebookAuthentication] - FACEBOOK --- ///
  // Future<UserCredential> signInWithFacebook() async {
  //   try {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login(permissions: ['email']);

  //     // Create a credential from the access token
  //     final AccessToken accessToken = loginResult.accessToken!;
  //     final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);

  //     // Once signed in, return the UserCredential
  //     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  /// --- ./end FEDERATED IDENTY & SOCIAL SIGN-IN --- ///
  ///
  ///
  /// --- [LogoutUser] - Valid for any authentication --- ///
  Future<void> logout() async {
    await _auth.auth.signOut();

    // try {
    //   await GoogleSignIn().signOut();
    //   // await FacebookAuth.instance.logOut();
    //   await _auth.signOut();
    //   Get.offAll(() => const LoginScreen());
    // } on FirebaseAuthException catch (e) {
    //   throw EBaseAuthException(e.code).message;
    // } on FirebaseException catch (e) {
    //   throw EBaseException(e.code).message;
    // } on FormatException catch (_) {
    //   throw const EFormatException();
    // } on PlatformException catch (e) {
    //   throw EPlatformException(e.code).message;
    // } catch (e) {
    //   throw EText.errorLong;
    // }
  }

  /// --- DELETE USER - Remove user Auth and Firestore Account --- ///

  /// DELETE USER - Remove user Auth and Firestore Account.
  Future<void> deleteAccount() async {
    //   try {
    //     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
    //     await _auth.currentUser?.delete();
    //   } on FirebaseAuthException catch (e) {
    //     throw EBaseAuthException(e.code).message;
    //   } on FirebaseException catch (e) {
    //     throw EBaseException(e.code).message;
    //   } on FormatException catch (_) {
    //     throw const EFormatException();
    //   } on PlatformException catch (e) {
    //     throw EPlatformException(e.code).message;
    //   } catch (e) {
    //     throw EText.errorLong;
    //   }
    // }
  }
}
