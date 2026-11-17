import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_bottom_actions.dart';
import '../widgets/onboarding_dots_indicator.dart';
import '../widgets/onboarding_page_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          const OnboardingBackground(),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.totalPages,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      return OnboardingPageItem(
                        item: controller.items[index],
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
                Obx(
                  () => OnboardingDotsIndicator(
                    count: controller.totalPages,
                    activeIndex: controller.currentPage.value,
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: OnboardingBottomActions(controller: controller),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
