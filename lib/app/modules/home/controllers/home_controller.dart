import 'package:flutter/material.dart';
import 'package:flutter_ecom/app/modules/card/bindings/card_binding.dart';
import 'package:flutter_ecom/app/modules/card/views/card_view.dart';
import 'package:flutter_ecom/app/modules/product/bindings/product_binding.dart';
import 'package:flutter_ecom/app/modules/product/views/product_view.dart';
import 'package:flutter_ecom/app/modules/profile/views/profile_view.dart';
import 'package:flutter_ecom/app/modules/search-product/bindings/search_product_binding.dart';
import 'package:flutter_ecom/app/modules/search-product/views/search_product_view.dart';
import 'package:flutter_ecom/app/routes/app_pages.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {

  var currentIndex = 0.obs;

  final pages = <String>[
    Routes.PRODUCT,
    Routes.SEARCH_PRODUCT,
    Routes.CARD,
    Routes.PROFILE,
  ];

  void changePage(int index){
    if(currentIndex.value == index) return;
    currentIndex.value =index;
    Get.offAndToNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == Routes.PRODUCT) {
      return GetPageRoute(
        settings: settings,
        page: () => ProductView(),
        binding: ProductBinding(),
      );
    }

    if (settings.name == Routes.SEARCH_PRODUCT) {
      return GetPageRoute(
        settings: settings,
        page: () => SearchProductView(),
        binding: SearchProductBinding(),
        fullscreenDialog: true,
      );
    }

    if (settings.name == Routes.CARD) {
      return GetPageRoute(
        settings: settings,
        page: () => CardView(),
        binding: CardBinding(),
      );
    }

    if (settings.name == Routes.PROFILE) {
      return GetPageRoute(
        settings: settings,
        page: () => ProfileView(),
        binding: ProductBinding(),
      );
    }

    return null;
  }
}
