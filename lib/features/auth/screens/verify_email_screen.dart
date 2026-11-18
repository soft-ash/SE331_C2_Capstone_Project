import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../controllers/verify_email_controller.dart';
import '../widgets/auth_back_button.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyEmailController controller = Get.put(VerifyEmailController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.h),
              const AuthBackButton(),
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  'assets/images/auth/auth_verify_email.png',
                  height: 130.h,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  AppStrings.verifyYourEmail.tr,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.brandNavy,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      AppStrings.sentVerificationLinkTo.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.brandSubtitle,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      controller.email,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.authGreen,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppStrings.checkInboxDesc.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.brandSubtitle,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              // Timer pill banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: AppColor.authGreenLight,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 24.sp,
                      color: AppColor.authGreen,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.didntReceiveEmail.tr,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.gray800,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Obx(
                            () {
                              final int sec = controller.secondsRemaining.value;
                              final String formatted =
                                  '00:${sec.toString().padLeft(2, '0')}';
                              return Text(
                                '${AppStrings.resendIn.tr}$formatted',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.authGreen,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Obx(
                () => CustomButton(
                  text: AppStrings.resendEmail.tr,
                  height: 50.h,
                  radius: 25.r,
                  color: AppColor.whiteColor,
                  border: Border.all(
                    color: controller.canResend.value
                        ? AppColor.brandNavy
                        : AppColor.gray300,
                    width: 1.2.w,
                  ),
                  textColor: controller.canResend.value
                      ? AppColor.brandNavy
                      : AppColor.gray400,
                  onPressed: controller.canResend.value
                      ? controller.resendEmail
                      : null,
                ),
              ),
              SizedBox(height: 16.h),
              // Helper to simulate verification for testing/demo
              Center(
                child: TextButton(
                  onPressed: controller.onVerified,
                  child: Text(
                    'Simulate Email Verified (Demo)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColor.gray400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
