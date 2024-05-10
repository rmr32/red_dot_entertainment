import 'package:red_dot_entertainment/utils/constants/exports.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Repository class for user-related operations.
class SubscriberRepository extends GetxController {
  static SubscriberRepository get instance => Get.find();

  final Supabase _db = Supabase.instance;
  // final _baseStorage = Supabase.instance;
  GlobalKey<FormState> subscribeFormKey = GlobalKey<FormState>();

  Future<void> saveEmail(String email) async {
    try {
      // var data = await Supabase.instance.client
      //     .from(EText.subscribe)
      //     .select('*')
      //     .eq(EText.dbEmail, email);
      // if (data.isNotEmpty) {
      //   print('Email already subscribed');
      //   return;
      // } else {
      print('Trying to save');
      await _db.client
          .from(EText.dbSubscriptions)
          .insert({EText.dbEmail: email});
      print('success');
      // }
      // } on SupabaseRealtimeError catch (e) {
      //   throw e.message.toString();
    } catch (e) {
      throw "Email may already be in our database.";
    }
    // await Supabase.instance.client.from(EText.subscribe).select('*').eq(EText.dbEmail, email);
    // await Supabase.instance.client.from(EText.subscribe).insert({EText.dbEmail: email});
  }
}
