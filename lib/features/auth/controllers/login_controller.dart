import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    AppLogger.info('LoginController initialized');
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      AppLogger.info('Attempting login for: ${emailController.text}');
      // In production API flow, call AuthService/ApiClient here
      Get.offAllNamed(AppRoutes.home);
    }
  }

  void signInWithGoogle() {
    AppLogger.info('Google sign-in clicked');
  }

  void signInWithFacebook() {
    AppLogger.info('Facebook sign-in clicked');
  }

  void signInWithApple() {
    AppLogger.info('Apple sign-in clicked');
  }

  void goToForgotPassword() {
    Get.toNamed(AppRoutes.forgotPassword);
  }

  void goToRegister() {
    Get.toNamed(AppRoutes.register);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    AppLogger.info('LoginController disposed');
    super.onClose();
  }
}
