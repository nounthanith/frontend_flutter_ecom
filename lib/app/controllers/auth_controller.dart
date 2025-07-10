import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
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

  // Sign Up
  Future<void> signUp() async {
    if (signUpFormKey.currentState!.validate()) {
      isLoading.value = true;

      try {
        // Simulate API call
        await Future.delayed(Duration(seconds: 2));

        // Add your sign up logic here
        Get.snackbar(
          'Success',
          'Account created successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Sign up failed. Please try again.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Validators
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
