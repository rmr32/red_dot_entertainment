import 'package:red_dot_entertainment/utils/constants/exports.dart';

class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Constructor
  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  /// Convert a CartItem to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      EText.dbCartModelProductId: productId,
      EText.dbCartModelTitle: title,
      EText.dbCartModelPrice: price,
      EText.dbCartModelImage: image,
      EText.dbCartModelQuantity: quantity,
      EText.dbCartModelVariationId: variationId,
      EText.dbCartModelBrandName: brandName,
      EText.dbCartModelSelectedVariation: selectedVariation,
    };
  }

  /// Create a CartItem from a JSON Map
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json[EText.dbCartModelProductId],
      title: json[EText.dbCartModelTitle],
      price: json[EText.dbCartModelPrice]?.toDouble(),
      image: json[EText.dbCartModelImage],
      quantity: json[EText.dbCartModelQuantity],
      variationId: json[EText.dbCartModelVariationId],
      brandName: json[EText.dbCartModelBrandName],
      selectedVariation: json[EText.dbCartModelSelectedVariation] != null
          ? Map<String, String>.from(json[EText.dbCartModelSelectedVariation])
          : null,
    );
  }
}
