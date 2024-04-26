// import 'package:red_dot_entertainment/features/store/models/payment_model.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';

// class CheckoutController extends GetxController {
//   static CheckoutController get instance => Get.find();

//   final Rx<PaymentMethodModel> selectedPaymentMethod =
//       PaymentMethodModel.empty().obs;

//   @override
//   void onInit() {
//     selectedPaymentMethod.value =
//         PaymentMethodModel(name: EText.paypal, image: EImages.iconPaypal);
//     super.onInit();
//   }

//   Future<dynamic> selectPaymentMethod(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (_) => SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(ESizes.lg),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const ESectionHeading(
//                   title: EText.paymentSelectMethod, showActionButton: false),
//               const SizedBox(height: ESizes.spaceBtwSections),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.paypal, image: EImages.iconPaypal)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.googlePay, image: EImages.iconGoogle)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.applePay, image: EImages.iconApple)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.visa, image: EImages.iconVisa)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.masterCard, image: EImages.iconMasterCard)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.paytm, image: EImages.iconPaytm)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.paystack, image: EImages.iconPaystack)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               EPaymentCard(
//                   paymentMethod: PaymentMethodModel(
//                       name: EText.card, image: EImages.iconCard)),
//               const SizedBox(height: ESizes.spaceBtwItems / 2),
//               const SizedBox(height: ESizes.spaceBtwSections),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
