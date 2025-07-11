import 'package:get/get.dart';

import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/search-product/bindings/search_product_binding.dart';
import '../modules/search-product/views/search_product_view.dart';
// import '../modules/search/bindings/search_binding.dart';
// import '../modules/search/views/search_view.dart';
import '../modules/signIn/views/sign_in_view.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../views/auth_wrapper.dart';

// import 'package:salait_ecommerce/app/views/auth_wrapper.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.SIGN_IN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
    ),
    //AuthWrapper
    GetPage(
      name: "/authWrapper",
      page: () => AuthWrapper(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    // GetPage(
    //   name: _Paths.SEARCH,
    //   page: () => const SearchView(),
    //   binding: SearchBinding(),
    // ),
    GetPage(
      name: _Paths.CARD,
      page: () => const CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PRODUCT,
      page: () => const SearchProductView(),
      binding: SearchProductBinding(),
    ),
  ];
}
