// import 'package:red_dot_entertainment/utils/constants/exports.dart';

// class AllProductsController extends GetxController {
//   static AllProductsController get instance => Get.find();

//   // Variables used to keep the selected features.
//   final RxList<ProductModel> products = <ProductModel>[].obs;
//   final RxString selectedSortOption = EText.productSortName.obs;
//   final RxString selectedFilter = ''.obs;

//   Future<List<ProductModel>> fetchProducts(Query query) async {
//     try {
//       final querySnapshot = await query.get();
//       final List<ProductModel> productList = querySnapshot.docs
//           .map((doc) => ProductModel.fromQuerySnapshot(doc))
//           .toList();
//       return productList;
//     } catch (e) {
//       print('${EText.errorFetchingProducts} $e');
//       return [];
//     }
//   }

//   void assignProducts(List<ProductModel> products) {
//     // Assign products to the 'products' list
//     this.products.assignAll(products);
//     sortProducts(EText.productSortName);
//   }

//   void sortProducts(String sortOption) {
//     selectedSortOption.value = sortOption;

//     switch (sortOption) {
//       case EText.productSortName:
//         products.sort((a, b) => a.title.compareTo(b.title));
//         break;
//       case EText.productSortHigherPrice:
//         products.sort((a, b) => b.price.compareTo(a.price));
//         break;
//       case EText.productSortLowerPrice:
//         products.sort((a, b) => a.price.compareTo(b.price));
//         break;
//       case EText.productSortNewest:
//         products.sort((a, b) => a.date!.compareTo(b.date!));
//         break;
//       case EText.productSortSale:
//         products.sort((a, b) {
//           if (b.salePrice > 0) {
//             return b.salePrice.compareTo(a.salePrice);
//           } else if (a.salePrice > 0) {
//             return -1;
//           } else {
//             return 1;
//           }
//         });
//         break;
//       default:
//         // Default sorting option: Name
//         products.sort((a, b) => a.title.compareTo(b.title));
//     }
//   }

//   void applyFilter(String filter) {
//     selectedFilter.value = filter;
//     // Apply a filter to the 'products' list based on the selected filter
//   }
// }
