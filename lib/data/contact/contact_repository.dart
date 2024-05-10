import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Repository class for user-related operations.
class ContactRepository extends GetxController {
  static ContactRepository get instance => Get.find();

  final Supabase _db = Supabase.instance;
  // final _baseStorage = Supabase.instance;
  GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();

  Future<void> submitContactRequest(
      String firstName, String lastName, String email, String request) async {
    try {
      await _db.client.from(EText.dbContact).insert({
        EText.dbFirstName: firstName,
        EText.dbLastName: lastName,
        EText.dbEmail: email,
        EText.dbRequest: request,
      });

      /// Function to reset form fields

      print('success');
      // }
      // } on SupabaseRealtimeError catch (e) {
      //   throw e.message.toString();
    } catch (e) {
      throw "Error in submitting request.";
    }
    // await Supabase.instance.client.from(EText.subscribe).select('*').eq(EText.dbEmail, email);
    // await Supabase.instance.client.from(EText.subscribe).insert({EText.dbEmail: email});
  }
}
