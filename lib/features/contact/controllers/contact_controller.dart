import 'package:red_dot_entertainment/data/contact/contact_repository.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

import 'package:red_dot_entertainment/utils/popups/loaders.dart';

class ContactController extends GetxController {
  static ContactController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final request = TextEditingController();

  GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  void submitContactForm(
      String firstName, String lastName, String email, String request) async {
    try {
      /// --- CHECK FORM VALIDATION --- ///
      if (!contactFormKey.currentState!.validate()) {
        //Todo: Stop Loading Animation
        ELoaders.showSnackBarError(title: 'Form Validation Error');

        return;
      }

      /// --- SAVE REQUEST DATABASE --- ///
      final contactRepository = Get.put(ContactRepository());
      await contactRepository.submitContactRequest(
          firstName, lastName, email, request);
      resetFormFields();
      Navigator.of(Get.context!).pop();
      ELoaders.showSnackBarSuccess();
    } catch (e) {
      /// --- Show some Generic Error to the user --- ///
      ELoaders.showSnackBarError(title: 'Whoops', message: e.toString());
      return;
    }
  }

  void resetFormFields() {
    firstName.clear();
    lastName.clear();
    email.clear();
    request.clear();
    contactFormKey.currentState?.reset();
  }
}
