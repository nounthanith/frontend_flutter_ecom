import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecom/app/data/providers/api_provider.dart';
import 'package:flutter_ecom/app/routes/app_pages.dart';
import 'package:flutter_ecom/app/services/storage_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _api = Get.find<APIProvider>();
  // Observable variables
  var isSignIn = true.obs;
  var isLoading = false.obs;
  var obscurePassword = true.obs;
  var obscureConfirmPassword = true.obs;

  // Form controllers
  final emailController = TextEditingController(text: "pich@gmail.com");
  final passwordController = TextEditingController(text: "12345678");
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
        final response = await _api.signIn(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        if (response.statusCode != 200) throw Exception("Failed to sign in: ${response.data['message']}");

        final data = response.data;
        StorageService.write(key: 'token', value: data['token']);
        StorageService.write(key: 'user', value: jsonEncode(data['user']));

        Get.offAllNamed(Routes.HOME);
      } catch (e) {
        Get.snackbar(
          'Error',
          'Login failed. Please try again. ${e.toString()}',
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
        final name = nameController.text;
        final email = emailController.text.trim();
        final password = passwordController.text.trim();

        final response = await _api.signUp(
          name: name,
          email: email,
          password: password,
        );

        if (response.statusCode != 200) throw Exception("Failed to sign up: ${response.data['message']}");

        // Add your sign up logic here
        Get.defaultDialog(
          title: "Success",
          middleText: "Registration successful",
          confirm: TextButton(
            onPressed: () {
              Get.back(result: {'email': email, 'password': password});
              toggleAuthMode();
              clearControllers();
            },
            child: const Text("OK"),
          ),
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Sign up failed. Please try again.${e.toString()}',

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
