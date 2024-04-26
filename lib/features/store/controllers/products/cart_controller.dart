// import 'package:red_dot_entertainment/features/store/models/cart_item_model.dart';
// import 'package:red_dot_entertainment/utils/constants/exports.dart';

// class CartController extends GetxController {
//   static CartController get instance => Get.find();

//   RxInt noOfCartItems = 0.obs;
//   RxDouble totalCartPrice = 0.0.obs;
//   RxInt productQuantityInCart = 0.obs;
//   RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
//   final variationController = VariationController.instance;

//   CartController() {
//     loadCartItems();
//   }

//   /// This function converts a ProductModel to a CartItemModel
//   CartItemModel convertToCartItem(ProductModel product, int quantity) {
//     if (product.productType == ProductType.single.toString()) {
//       // Reset Variation in case of single product type.
//       variationController.resetSelectedAttributes();
//     }
//     final variation = variationController.selectedVariation.value;
//     final isVariation =
//         variationController.selectedVariation.value.id.isNotEmpty;
//     final price = isVariation
//         ? variation.salePrice > 0.0
//             ? variation.salePrice
//             : variation.price
//         : product.salePrice > 0.0
//             ? product.salePrice
//             : product.price;
//     return CartItemModel(
//       productId: product.id,
//       title: product.title,
//       price: price,
//       image: isVariation ? variation.image : product.thumbnail,
//       quantity: quantity,
//       variationId: variation.id,
//       brandName: product.brand != null ? product.brand!.name : '',
//       selectedVariation: isVariation ? variation.attributeValues : null,
//     );
//   }

//   void addToCart(ProductModel product) {
//     if (productQuantityInCart.value < 1) {
//       EHelperFunctions.showSnackBarCustom(message: EText.cartSelectQuantity);
//       return;
//     }

//     if (product.productType == ProductType.variable.toString() &&
//         variationController.selectedVariation.value.id.isEmpty) {
//       EHelperFunctions.showSnackBarCustom(message: EText.cartSelectVariation);
//       return;
//     }

//     if (product.productType == ProductType.variable.toString()) {
//       if (variationController.selectedVariation.value.stock < 1) {
//         EHelperFunctions.showSnackBarWarning(
//             title: EText.error, message: EText.cartSelectVariationOOS);
//         return;
//       }
//     } else {
//       if (product.stock < 1) {
//         EHelperFunctions.showSnackBarWarning(
//             title: EText.error, message: EText.cartSelectProductOOS);
//         return;
//       }
//     }

//     // Convert the ProductModel to a CartItemModel with the given quantity
//     final selectedCartItem =
//         convertToCartItem(product, productQuantityInCart.value);
//     int index = cartItems.indexWhere((cartItem) =>
//         cartItem.productId == selectedCartItem.productId &&
//         cartItem.variationId == selectedCartItem.variationId);

//     if (index >= 0) {
//       // This quantity is already added or removed from the design
//       cartItems[index].quantity = selectedCartItem.quantity;
//     } else {
//       cartItems.add(selectedCartItem);
//     }

//     updateCart();
//     EHelperFunctions.showSnackBarCustom(message: EText.cartSelectionAdded);
//   }

//   void addOneToCart(CartItemModel item) {
//     int index = cartItems.indexWhere((cartItem) =>
//         cartItem.productId == item.productId &&
//         cartItem.variationId == item.variationId);

//     if (index >= 0) {
//       cartItems[index].quantity += 1;
//     } else {
//       cartItems.add(item);
//     }

//     updateCart();
//   }

//   void removeOneFromCart(CartItemModel item) {
//     int index = cartItems.indexWhere((cartItem) =>
//         cartItem.productId == item.productId &&
//         cartItem.variationId == item.variationId);

//     if (index >= 0) {
//       if (cartItems[index].quantity > 1) {
//         cartItems[index].quantity -= 1;
//       } else {
//         // Show dialog before completely removing
//         cartItems[index].quantity == 1
//             ? removeFromCartDialog(index)
//             : cartItems.removeAt(index);
//       }
//       updateCart();
//     }
//   }

//   void removeFromCartDialog(int index) {
//     Get.defaultDialog(
//       title: EText.cartSelectionRemove,
//       middleText: EText.cartSelectionRemoveConfirm,
//       onConfirm: () {
//         // Remove the item from the cart
//         cartItems.removeAt(index);
//         updateCart();
//         EHelperFunctions.showSnackBarCustom(
//             message: EText.cartSelectionRemoved);
//         Get.back();
//       },
//       onCancel: () => () => Get.back(),
//     );
//   }

//   void updateCart() {
//     updateCartTotals();
//     saveCartItems();
//     cartItems.refresh();
//   }

//   void loadCartItems() async {
//     final cartItemStrings =
//         ELocalStorage.instance().readData<List<dynamic>>(EText.dbCartItems);
//     if (cartItemStrings != null) {
//       cartItems.assignAll(cartItemStrings
//           .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
//       updateCartTotals();
//     }
//   }

//   void updateCartTotals() {
//     double calculatedTotalPrice = 0.0;
//     int calculatedNoOfItems = 0;

//     for (var item in cartItems) {
//       calculatedTotalPrice += (item.price) * item.quantity.toDouble();
//       calculatedNoOfItems += item.quantity;
//     }

//     totalCartPrice.value = calculatedTotalPrice;
//     noOfCartItems.value = calculatedNoOfItems;
//   }

//   void saveCartItems() {
//     final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
//     ELocalStorage.instance().writeData(EText.dbCartItems, cartItemStrings);
//   }

//   /// -- Initialize already added Item's Count in the cart.
//   void updateAlreadyAddedProductCount(ProductModel product) {
//     // If product has no variations then calculate cartEntries and display total number.
//     // Else make default entries to 0 and show cartEntries when variation is selected.
//     if (product.productType == ProductType.single.toString()) {
//       productQuantityInCart.value = getProductQuantityInCart(product.id);
//     } else {
//       // Get selected Variation if any...
//       final variationId = variationController.selectedVariation.value.id;
//       if (variationId.isNotEmpty) {
//         productQuantityInCart.value =
//             getVariationQuantityInCart(product.id, variationId);
//       } else {
//         productQuantityInCart.value = 0;
//       }
//     }
//   }

//   int getProductQuantityInCart(String productId) {
//     final foundItem = cartItems
//         .where((item) => item.productId == productId)
//         .fold(0, (previousValue, element) => previousValue + element.quantity);
//     return foundItem;
//   }

//   int getVariationQuantityInCart(String productId, String variationId) {
//     final foundItem = cartItems.firstWhere(
//       (item) => item.productId == productId && item.variationId == variationId,
//       orElse: () => CartItemModel.empty(),
//     );

//     return foundItem.quantity;
//   }

//   void clearCart() {
//     productQuantityInCart.value = 0;
//     cartItems.clear();
//     updateCart();
//   }
// }
