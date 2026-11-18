import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/forgot_password_controller.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_header.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller =
        Get.put(ForgotPasswordController());

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
                SizedBox(height: 24.h),
                Center(
                  child: Image.asset(
                    'assets/images/auth/auth_forgot_password.png',
                    height: 140.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const SizedBox(),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: AuthHeader(
                    title: AppStrings.forgotPasswordTitle.tr,
                    subtitle: AppStrings.forgotPasswordDesc.tr,
                  ),
                ),
                SizedBox(height: 28.h),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.emailAddress.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.mail_outline_rounded),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter your email'
                      : null,
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: AppStrings.sendResetLink.tr,
                  height: 50.h,
                  radius: 25.r,
                  color: AppColor.authGreen,
                  textColor: AppColor.whiteColor,
                  suffixIcon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: controller.sendResetLink,
                ),
                SizedBox(height: 32.h),
                Center(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.rememberPasswordQuestion.tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColor.gray600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      GestureDetector(
                        onTap: controller.backToSignIn,
                        child: Text(
                          AppStrings.backToSignIn.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.authGreen,
                          ),
                        ),
                      ),
                    ],
                  ),
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
