import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingBottomActions extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingBottomActions({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final int index = controller.currentPage.value;

      if (index == 0) {
        // Slide 1: Full-width "Next ->"
        return CustomButton(
          text: AppStrings.next.tr,
          height: 52.h,
          radius: 26.r,
          color: AppColor.brandNavy,
          textColor: AppColor.whiteColor,
          suffixIcon: const Icon(Icons.arrow_forward_rounded),
          onPressed: controller.nextPage,
        );
      } else if (index == 1) {
        // Slide 2: "Back" + "Next ->"
        return Row(
          children: [
            Expanded(
              flex: 4,
              child: CustomButton(
                text: AppStrings.back.tr,
                height: 52.h,
                radius: 26.r,
                color: AppColor.whiteColor,
                border: Border.all(
                  color: AppColor.brandNavy,
                  width: 1.2.w,
                ),
                textColor: AppColor.brandNavy,
                onPressed: controller.previousPage,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              flex: 5,
              child: CustomButton(
                text: AppStrings.next.tr,
                height: 52.h,
                radius: 26.r,
                color: AppColor.brandNavy,
                textColor: AppColor.whiteColor,
                suffixIcon: const Icon(Icons.arrow_forward_rounded),
                onPressed: controller.nextPage,
              ),
            ),
          ],
        );
      } else {
        // Slide 3: Full-width "Get Started ->"
        return CustomButton(
          text: AppStrings.getStarted.tr,
          height: 52.h,
          radius: 26.r,
          color: AppColor.brandNavy,
          textColor: AppColor.whiteColor,
          suffixIcon: const Icon(Icons.arrow_forward_rounded),
          onPressed: controller.getStarted,
        );
      }
    });
  }
}
