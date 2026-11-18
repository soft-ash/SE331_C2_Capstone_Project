import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool agreeToTerms = false.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    AppLogger.info('RegisterController initialized');
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void toggleAgreeToTerms(bool? value) {
    agreeToTerms.value = value ?? false;
  }

  void register() {
    if (!agreeToTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please agree to the Terms & Conditions and Privacy Policy',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (formKey.currentState?.validate() ?? false) {
      AppLogger.info('Registering user: ${emailController.text}');
      // On success, go to Verify Email screen
      Get.toNamed(
        AppRoutes.verifyEmail,
        arguments: {'email': emailController.text.trim()},
      );
    }
  }

  void goToSignIn() {
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    AppLogger.info('RegisterController disposed');
    super.onClose();
  }
}
