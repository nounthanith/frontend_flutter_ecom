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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child:
            authController.isSignIn.value ? SignInView() : SignUpView(),
          )),
        ),
      ),
    );
  }
}
