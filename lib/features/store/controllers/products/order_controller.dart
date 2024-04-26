// import 'package:red_dot_entertainment/utils/constants/exports.dart';

// class OrderController extends GetxController {
//   static OrderController get instance => Get.find();

//   /// Variables
//   final cartController = CartController.instance;
//   final addressController = AddressController.instance;
//   final checkoutController = CheckoutController.instance;
//   final orderRepository = Get.put(OrderRepository());

//   /// Fetch user's order history
//   Future<List<OrderModel>> fetchUserOrders() async {
//     try {
//       final userOrders = await orderRepository.fetchUserOrders();
//       return userOrders;
//     } catch (e) {
//       EHelperFunctions.showSnackBarWarning(
//           title: EText.error, message: e.toString());
//       return [];
//     }
//   }

//   /// Add methods for order processing
//   void processOrder(double totalAmount) async {
//     try {
//       // Start Loader
//       EFullScreenLoader.openLoadingDialog(
//           EText.orderProcessing, EImages.animationOrderProcessing);

//       // Get user authentication Id
//       final userId = AuthenticationRepository.instance.getUserID;
//       if (userId.isEmpty) return;

//       // Add Details
//       final order = OrderModel(
//         // Generate a unique ID for the order
//         id: UniqueKey().toString(),
//         userId: userId,
//         status: OrderStatus.pending,
//         totalAmount: totalAmount,
//         orderDate: DateTime.now(),
//         paymentMethod: checkoutController.selectedPaymentMethod.value.name,
//         address: addressController.selectedAddress.value,
//         // Set Date as needed
//         deliveryDate: DateTime.now(),
//         items: cartController.cartItems.toList(),
//       );

//       // Save the order to Firestore
//       await orderRepository.saveOrder(order, userId);

//       // Update the cart status
//       cartController.clearCart();

//       // Show Success screen
//       Get.off(() => SuccessScreen(
//             image: EImages.animationOrderCompleted,
//             title: EText.orderPaymentSuccess,
//             subTitle: EText.orderShippingSoon,
//             onPressed: () => Get.offAll(() => const ENavigationMenu()),
//           ));
//     } catch (e) {
//       EHelperFunctions.showSnackBarError(
//           title: EText.error, message: e.toString());
//     }
//   }
// }
