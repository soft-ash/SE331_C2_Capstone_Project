import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';
import '../widgets/auth_header.dart';
import '../widgets/auth_social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                Image.asset(
                  'assets/images/logo.png',
                  width: 140.w,
                  // height: 60.h,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
                SizedBox(height: 24.h),

                AuthHeader(
                  title: AppStrings.welcomeBack.tr,
                  subtitle: AppStrings.signInToContinue.tr,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.emailAddress.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.mail_outline_rounded),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.passwordController,
                    hintText: AppStrings.password.tr,
                    obscureText: !controller.isPasswordVisible.value,
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8.h,
                  children: [
                    GestureDetector(
                      onTap: () => controller.toggleRememberMe(
                        !controller.rememberMe.value,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Obx(
                              () => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: controller.toggleRememberMe,
                                activeColor: AppColor.authGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            AppStrings.rememberMe.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColor.gray700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: controller.goToForgotPassword,
                      child: Text(
                        AppStrings.forgotPasswordQuestion.tr,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColor.authGreen,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  text: AppStrings.signIn.tr,
                  height: 50.h,
                  radius: 25.r,
                  color: AppColor.authGreen,
                  textColor: AppColor.whiteColor,
                  suffixIcon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: controller.login,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    const Expanded(child: Divider(color: AppColor.gray200)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        AppStrings.orContinueWith.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.gray500,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppColor.gray200)),
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AuthSocialButton(
                      onTap: controller.signInWithGoogle,
                      icon: Text(
                        'G',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFEA4335),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    AuthSocialButton(
                      onTap: controller.signInWithFacebook,
                      icon: Icon(
                        Icons.facebook,
                        size: 26.sp,
                        color: const Color(0xFF1877F2),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    AuthSocialButton(
                      onTap: controller.signInWithApple,
                      icon: Icon(
                        Icons.apple,
                        size: 26.sp,
                        color: AppColor.blackColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: AppStrings.dontHaveAccount.tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.gray600,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: controller.goToRegister,
                            child: Text(
                              AppStrings.register.tr,
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                                color: AppColor.authGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
