import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';
import '../../routes/app_routes.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  final RxBool isNewPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool hasMin8Chars = false.obs;
  final RxBool hasNumber = false.obs;
  final RxBool hasLetter = false.obs;

  @override
  void onInit() {
    super.onInit();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    newPasswordController.addListener(_validatePasswordRules);
    AppLogger.info('ResetPasswordController initialized');
  }

  void _validatePasswordRules() {
    final text = newPasswordController.text;
    hasMin8Chars.value = text.length >= 8;
    hasNumber.value = RegExp(r'[0-9]').hasMatch(text);
    hasLetter.value = RegExp(r'[a-zA-Z]').hasMatch(text);
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  void resetPassword() {
    if (formKey.currentState?.validate() ?? false) {
      if (!hasMin8Chars.value || !hasNumber.value || !hasLetter.value) {
        Get.snackbar(
          'Password Requirements',
          'Please satisfy all password conditions before submitting.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      AppLogger.success('Password successfully reset');
      Get.offNamed(AppRoutes.allSet);
    }
  }

  @override
  void onClose() {
    newPasswordController.removeListener(_validatePasswordRules);
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    AppLogger.info('ResetPasswordController disposed');
    super.onClose();
  }
}
