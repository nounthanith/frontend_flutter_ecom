import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController
// Observable variables
  var isSignIn = true.obs;
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  // Form controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  // Form keys
  final signInFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();

  // Toggle between sign in and sign up
  void toggleAuthMode() {
    isSignIn.value = !isSignIn.value;
    clearControllers();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword.value = !obscureConfirmPassword.value;
  }

  // Clear all controllers
  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    nameController.clear();
  }

  // Sign In
  Future<void> signIn() async {
    if (signInFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // Simulate API call
        await Future.delayed(Duration(seconds: 2));

        // Add your sign in logic here
        Get.snackbar(
          'Success',
          'Signed in successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Sign in failed. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
