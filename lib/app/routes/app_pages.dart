import 'package:flutter_ecom/app/views/auth_wrapper.dart';
import 'package:get/get.dart';
// import 'package:salait_ecommerce/app/views/auth_wrapper.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signIn/bindings/sign_in_binding.dart';
import '../modules/signIn/views/sign_in_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';

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
      binding: SignInBinding(),
    ),
    //AuthWrapper
    GetPage(
      name: "/authWrapper",
      page: () => AuthWrapper(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
