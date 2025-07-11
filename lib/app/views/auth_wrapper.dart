import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../modules/signIn/views/sign_in_view.dart';
import '../modules/signUp/views/sign_up_view.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: Colors.grey[100], // light gray for neubrutalism base
      body: SafeArea(
        child: Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: authController.isSignIn.value
              ? SignInView()
              : SignUpView(),
        )),
      ),
    );

  }
}
