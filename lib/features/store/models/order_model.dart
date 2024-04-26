// import 'package:red_dot_entertainment/features/store/models/cart_item_model.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';
// import 'package:red_dot_entertainment/utils/helpers.dart/helper_functions.dart';

// class OrderModel {
//   final String id;
//   final String userId;
//   final OrderStatus status;
//   final double totalAmount;
//   final DateTime orderDate;
//   final String paymentMethod;
//   final AddressModel? address;
//   final DateTime? deliveryDate;
//   final List<CartItemModel> items;

//   OrderModel({
//     required this.id,
//     this.userId = '',
//     required this.status,
//     required this.items,
//     required this.totalAmount,
//     required this.orderDate,
//     this.paymentMethod = EText.paypal,
//     this.address,
//     this.deliveryDate,
//   });

//   String get formattedOrderDate => EHelperFunctions.getFormattedDate(orderDate);

//   String get formattedDeliveryDate => deliveryDate != null
//       ? EHelperFunctions.getFormattedDate(deliveryDate!)
//       : '';

//   String get orderStatusText => status == OrderStatus.delivered
//       ? EText.dbOrderDelivered
//       : status == OrderStatus.shipped
//           ? EText.dbOrderEnRoute
//           : EText.dbOrderProcessing;

//   Map<String, dynamic> toJson() {
//     return {
//       EText.dbOrderId: id,
//       EText.dbOrderUserId: userId,
//       EText.dbOrderStatus: status.toString(), // Enum to string
//       EText.dbOrderTotalAmount: totalAmount,
//       EText.dbOrderDate: orderDate,
//       EText.dbOrderPaymentMethod: paymentMethod,
//       EText.dbOrderAddress: address?.toJson(), // Convert AddressModel to map
//       EText.dbOrderDeliveryDate: deliveryDate,
//       EText.dbOrderItems: items
//           .map((item) => item.toJson())
//           .toList(), // Convert CartItemModel to map
//     };
//   }

//   factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;

//     return OrderModel(
//       id: data[EText.dbOrderId] as String,
//       userId: data[EText.dbOrderUserId] as String,
//       status: OrderStatus.values
//           .firstWhere((e) => e.toString() == data[EText.dbOrderStatus]),
//       totalAmount: data[EText.dbOrderTotalAmount] as double,
//       orderDate: (data[EText.dbOrderDate] as Timestamp).toDate(),
//       paymentMethod: data[EText.dbOrderPaymentMethod] as String,
//       address: AddressModel.fromMap(
//           data[EText.dbOrderAddress] as Map<String, dynamic>),
//       deliveryDate: data[EText.dbOrderDeliveryDate] == null
//           ? null
//           : (data[EText.dbOrderDeliveryDate] as Timestamp).toDate(),
//       items: (data[EText.dbOrderItems] as List<dynamic>)
//           .map((itemData) =>
//               CartItemModel.fromJson(itemData as Map<String, dynamic>))
//           .toList(),
//     );
//   }
// }
