import 'package:flutter/material.dart';
import 'package:flutter_ecom/app/modules/signIn/views/sign_in_view.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/social_login_button.dart';
import '../../../controllers/auth_controller.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),

          // Header
          Text(
            'Create Account',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Sign up to get started',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 40),

          // Sign Up Form
          Container(
            padding: EdgeInsets.all(24),
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
              key: authController.signUpFormKey,
              child: Column(
                children: [
                  // Name Field
                  CustomTextField(
                    controller: authController.nameController,
                    label: 'Full Name',
                    prefixIcon: Icons.person_outline,
                    validator: authController.validateName,
                  ),
                  SizedBox(height: 20),

                  // Email Field
                  CustomTextField(
                    controller: authController.emailController,
                    label: 'Email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: authController.validateEmail,
                  ),
                  SizedBox(height: 20),

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
                  SizedBox(height: 20),

                  // Confirm Password Field
                  Obx(() => CustomTextField(
                    controller: authController.confirmPasswordController,
                    label: 'Confirm Password',
                    prefixIcon: Icons.lock_reset,
                    obscureText: authController.obscureConfirmPassword.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        authController.obscureConfirmPassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed:
                      authController.toggleConfirmPasswordVisibility,
                    ),
                    validator: authController.validateConfirmPassword,
                  )),
                  SizedBox(height: 20),

                  // Sign Up Button
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: authController.signUp,
                  ),
                  SizedBox(height: 20),

                  // Divider
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Social Login Buttons
                  SocialLoginButton(
                    text: 'Continue with Google',
                    icon: Icons.g_mobiledata,
                    onPressed: () {
                      // Handle Google sign up
                    },
                  ),
                  SizedBox(height: 12),
                  SocialLoginButton(
                    text: 'Continue with Facebook',
                    icon: Icons.facebook,
                    onPressed: () {
                      // Handle Facebook sign up
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),

          // Sign In Link
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: authController.toggleAuthMode,
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
