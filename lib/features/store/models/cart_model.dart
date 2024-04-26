import 'package:red_dot_entertainment/features/store/models/cart_item_model.dart';

class CartModel {
  String cartId;
  List<CartItemModel> items;

  CartModel({
    required this.cartId,
    required this.items,
  });

  static CartModel empty() => CartModel(cartId: '', items: []);
}
