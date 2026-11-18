import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/reset_password_controller.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/password_requirement_item.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.put(ResetPasswordController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                const AuthBackButton(),
                SizedBox(height: 20.h),
                Center(
                  child: Image.asset(
                    'assets/images/auth/auth_reset_password.png',
                    height: 130.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: AuthHeader(
                    title: AppStrings.resetPassword.tr,
                    subtitle: AppStrings.enterNewPasswordBelow.tr,
                  ),
                ),
                SizedBox(height: 24.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.newPasswordController,
                    hintText: AppStrings.newPassword.tr,
                    obscureText: !controller.isNewPasswordVisible.value,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isNewPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: controller.toggleNewPasswordVisibility,
                    ),
                    validator: (val) => val == null || val.length < 8
                        ? 'Password must be at least 8 characters'
                        : null,
                  ),
                ),
                SizedBox(height: 12.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: AppStrings.confirmNewPassword.tr,
                    obscureText: !controller.isConfirmPasswordVisible.value,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isConfirmPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: controller.toggleConfirmPasswordVisibility,
                    ),
                    validator: (val) {
                      if (val != controller.newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Obx(
                  () => Column(
                    children: [
                      PasswordRequirementItem(
                        text: AppStrings.reqAtLeast8.tr,
                        isMet: controller.hasMin8Chars.value,
                      ),
                      PasswordRequirementItem(
                        text: AppStrings.reqIncludeNumber.tr,
                        isMet: controller.hasNumber.value,
                      ),
                      PasswordRequirementItem(
                        text: AppStrings.reqIncludeLetter.tr,
                        isMet: controller.hasLetter.value,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: AppStrings.resetPassword.tr,
                  height: 50.h,
                  radius: 25.r,
                  color: AppColor.authGreen,
                  textColor: AppColor.whiteColor,
                  suffixIcon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: controller.resetPassword,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
