import 'package:flutter_ecom/app/data/models/product.model.dart';
import 'package:flutter_ecom/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getProducts();
    super.onInit();
  }
  final _api = Get.find<APIProvider>();

  Rx<Product> product = Product().obs;
  RxBool isLoading = false.obs;

  void getProducts() async {
    try {
      isLoading(true);

      final response = await _api.getProducts();

      if (response!.statusCode != 200)
        throw Exception("Failed to fetch product: ${response.data['message']}");

      final data = response.data;
      product.value = Product.fromJson(data);
    } on Exception catch (e) {
      Get.snackbar("Error", "Failed to fetch product: $e");
    } finally {
      isLoading(false);
    }
  }
}

