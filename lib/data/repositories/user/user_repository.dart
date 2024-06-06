import 'package:red_dot_entertainment/utils/constants/exports.dart';

/// Repository class for user-related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // final FirebaseFirestore _db = FirebaseFirestore.instance;
  // final _baseStorage = FirebaseStorage.instance;

  /// Function to save user data to Firestore.
  // Future<void> saveUserRecord(UserModel user) async {
  //   try {
  //     await _db.collection(EText.dbUsers).doc(user.id).set(user.toJson());
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

  /// Function to fetch user details based on user ID.
  // Future<UserModel> fetchUserDetails() async {
  //   try {
  //     final documentSnapshot = await _db
  //         .collection(EText.dbUsers)
  //         .doc(AuthenticationRepository.instance.getUserID)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       return UserModel.fromSnapshot(documentSnapshot);
  //     } else {
  //       return UserModel.empty();
  //     }
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

  /// Function to update user data in Firestore.
  // Future<void> updateUserDetails(UserModel updatedUser) async {
  //   try {
  //     await _db
  //         .collection(EText.dbUsers)
  //         .doc(updatedUser.id)
  //         .update(updatedUser.toJson());
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

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    // try {
    //   await _db
    //       .collection(EText.dbUsers)
    //       .doc(AuthenticationRepository.instance.getUserID)
    //       .update(json);
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

  /// Upload any Image
  // Future<String> uploadImage(String path, XFile image) async {
  // try {
  //   final ref = _baseStorage.ref(path).child(image.name);
  //   await ref.putFile(File(image.path));
  //   final url = await ref.getDownloadURL();
  //   return url;
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

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    // try {
    //   await _db.collection(EText.dbUsers).doc(userId).delete();
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
}
