import 'package:red_dot_entertainment/common/responsive/responsive_layout.dart';
import 'package:red_dot_entertainment/utils/constants/exports.dart';

class AppRoutes {
  static final pages = [
    // GetPage(name: ERoutes.home, page: () => const HomeScreen()),
    GetPage(name: '/', page: () => const ResponsiveLayout()),

    // GetPage(name: ERoutes.reservations, page: () => const ReservationScreen()),
    // GetPage(name: ERoutes.favorites, page: () => const FavoriteScreen()),
    // GetPage(name: ERoutes.settings, page: () => const SettingsScreen()),
    // GetPage(name: ERoutes.search, page: () => SearchScreen()),
    // GetPage(name: ERoutes.productReviews, page: () => const ReviewScreen()),
    // GetPage(name: ERoutes.order, page: () => const OrderScreen()),
    // GetPage(name: ERoutes.checkout, page: () => const CheckoutScreen()),
    // GetPage(name: ERoutes.cart, page: () => const CartScreen()),
    // GetPage(name: ERoutes.userProfile, page: () => const ProfileScreen()),
    // GetPage(name: ERoutes.userAddress, page: () => const AddressScreen()),
    // GetPage(name: ERoutes.signup, page: () => const SignupScreen()),
    // GetPage(name: ERoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    // GetPage(name: ERoutes.signIn, page: () => const LoginScreen()),
    // GetPage(name: ERoutes.forgetPassword, page: () => const ForgotPassword()),
    // GetPage(name: ERoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}

// TO USE:
//    onTap: () {
//               Get.toNamed(ERoutes.home);
//             },