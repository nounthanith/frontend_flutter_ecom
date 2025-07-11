import 'package:flutter_ecom/app/data/providers/api_provider.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(APIProvider(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
