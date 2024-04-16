import 'package:red_dot_entertainment/utils/constants/exports.dart';

enum navPages {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

class EMaps {
  EMaps._();

  static const Map<String, int> navPage = {
    EText.home: 0,
    EText.about: 1,
    EText.price: 2,
    EText.beats: 3,
    EText.gallery: 4,
    EText.book: 5,
  };

  List<int> navPageValues = navPage.values.toList();
}
