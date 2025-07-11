import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_text_field.dart';
import '../../../components/social_login_button.dart';
import '../../../controllers/auth_controller.dart';
import '../../../components/custom_button.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Icon
          Center(
            child: Icon(
              Icons.lock_outline,
              size: 72,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),

          // Welcome Text
          const Center(
            child: Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // ⬛️ Neubrutalism Form Box
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: authController.signInFormKey,
              child: Column(
                children: [
                  // Email Field
                  CustomTextField(
                    controller: authController.emailController,
                    label: 'Email Address',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: authController.validateEmail,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  Obx(() => CustomTextField(
                    controller: authController.passwordController,
                    label: 'Password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: authController.obscurePassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.obscurePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: authController.togglePasswordVisibility,
                    ),
                    validator: authController.validatePassword,
                  )),
                  const SizedBox(height: 12),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Sign In Button
                  Obx(() => CustomButton(
                    text: "Sign In",
                    onPressed: authController.signIn,
                    isLoading: authController.isLoading.value,
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Sign Up Link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.black54),
              ),
              TextButton(
                onPressed: authController.toggleAuthMode,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );


  }
}
