import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class ForgotPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    AppLogger.info('ForgotPasswordController initialized');
  }

  void sendResetLink() {
    if (formKey.currentState?.validate() ?? false) {
      AppLogger.info('Sending reset link to: ${emailController.text}');
      // On success, go to Reset Password screen or verify screen
      Get.toNamed(
        AppRoutes.resetPassword,
        arguments: {'email': emailController.text.trim()},
      );
    }
  }

  void backToSignIn() {
    Get.back();
  }

  @override
  void onClose() {
    emailController.dispose();
    AppLogger.info('ForgotPasswordController disposed');
    super.onClose();
  }
}
