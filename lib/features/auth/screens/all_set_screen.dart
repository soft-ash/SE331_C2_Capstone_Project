import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../controllers/all_set_controller.dart';
import '../widgets/auth_header.dart';

class AllSetScreen extends StatelessWidget {
  const AllSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AllSetController controller = Get.put(AllSetController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Image.asset(
                'assets/images/auth/auth_all_set.png',
                height: 160.h,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
              SizedBox(height: 32.h),
              AuthHeader(
                title: AppStrings.allSet.tr,
                subtitle: AppStrings.accountVerifiedSuccess.tr,
              ),
              const Spacer(flex: 4),
              CustomButton(
                text: AppStrings.continueBtn.tr,
                height: 50.h,
                radius: 25.r,
                color: AppColor.authGreen,
                textColor: AppColor.whiteColor,
                suffixIcon: const Icon(Icons.arrow_forward_rounded),
                onPressed: controller.onContinue,
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
