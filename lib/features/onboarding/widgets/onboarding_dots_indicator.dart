import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../core/constants/colors.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;

  const OnboardingDotsIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final bool isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: isActive ? 8.w : 7.w,
          height: isActive ? 8.h : 7.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColor.brandTeal : AppColor.dotInactiveColor,
          ),
        );
      }),
    );
  }
}
