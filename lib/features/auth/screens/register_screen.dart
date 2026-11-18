import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/register_controller.dart';
import '../widgets/auth_back_button.dart';
import '../widgets/auth_header.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

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
                SizedBox(height: 8.h),
                Center(
                  child: Image.asset(
                    'assets/images/auth/auth_register_header.png',
                    height: 120.h,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox(),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: AuthHeader(
                    title: AppStrings.createAccount.tr,
                    subtitle: AppStrings.joinGhorBari.tr,
                  ),
                ),
                SizedBox(height: 18.h),
                CustomTextField(
                  controller: controller.nameController,
                  hintText: AppStrings.fullName.tr,
                  prefixIcon: const Icon(Icons.person_outline_rounded),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: controller.emailController,
                  hintText: AppStrings.emailAddress.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.mail_outline_rounded),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter your email'
                      : null,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  controller: controller.phoneController,
                  hintText: AppStrings.phoneNumber.tr,
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(Icons.phone_outlined),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter your phone number'
                      : null,
                ),
                SizedBox(height: 10.h),
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
                    validator: (val) => val == null || val.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                  ),
                ),
                SizedBox(height: 10.h),
                Obx(
                  () => CustomTextField(
                    controller: controller.confirmPasswordController,
                    hintText: AppStrings.confirmPassword.tr,
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
                      if (val != controller.passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Obx(
                        () => Checkbox(
                          value: controller.agreeToTerms.value,
                          onChanged: controller.toggleAgreeToTerms,
                          activeColor: AppColor.authGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.termsAgree.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.gray700,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.termsConditions.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.authGreen,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.and.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColor.gray700,
                              ),
                            ),
                            TextSpan(
                              text: AppStrings.privacyPolicy.tr,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.authGreen,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  text: AppStrings.register.tr,
                  height: 50.h,
                  radius: 25.r,
                  color: AppColor.authGreen,
                  textColor: AppColor.whiteColor,
                  suffixIcon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: controller.register,
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: AppStrings.alreadyHaveAccount.tr,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.gray600,
                      ),
                      children: [
                        const TextSpan(text: ' '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: GestureDetector(
                            onTap: controller.goToSignIn,
                            child: Text(
                              AppStrings.signIn.tr,
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
