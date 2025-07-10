import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_text_field.dart';
import '../../../components/social_login_button.dart';
import '../../../controllers/auth_controller.dart';

class SignInView extends StatelessWidget {
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
            'Welcome Back!',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Sign in to your account',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 40),

          // Sign In Form
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
              key: authController.signInFormKey,
              child: Column(
                children: [
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
                  SizedBox(height: 12),

                  // Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(0xFF667eea),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Sign In Button

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
                      // Handle Google sign in
                    },
                  ),
                  SizedBox(height: 12),
                  SocialLoginButton(
                    text: 'Continue with Facebook',
                    icon: Icons.facebook,
                    onPressed: () {
                      // Handle Facebook sign in
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),

          // Sign Up Link
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: Colors.white70),
                ),
                TextButton(
                  onPressed: authController.toggleAuthMode,
                  child: Text(
                    'Sign Up',
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

class CustomButton {
}
