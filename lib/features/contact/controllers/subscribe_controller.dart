import 'package:red_dot_entertainment/data/subscribers/subscriber_repository.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:red_dot_entertainment/utils/popups/full_screen_loader.dart';
import 'package:red_dot_entertainment/utils/popups/loaders.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SubscribeController extends GetxController {
  static SubscribeController get instance => Get.find();

  final email = TextEditingController(); // --- Controller for email input

  GlobalKey<FormState> subscribeFormKey =
      GlobalKey<FormState>(); // Form key for form validation

  void joinSubscription(String email) async {
    try {
      /// --- CHECK EMAIL VALIDATION --- ///
      if (!subscribeFormKey.currentState!.validate()) {
        //Todo: Stop Loading Animation
        ELoaders.showSnackBarError(title: 'Not Validated Email');

        return;
      }

      /// --- SAVE EMAIL INTO SUBSCRIPTION DATABASE --- ///
      final subscriberRepository = Get.put(SubscriberRepository());
      await subscriberRepository.saveEmail(email);
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
    email.clear();

    subscribeFormKey.currentState?.reset();
  }
}
