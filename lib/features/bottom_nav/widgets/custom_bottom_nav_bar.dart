import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../controllers/bottom_nav_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller;

  const CustomBottomNavBar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border(
          top: BorderSide(
            color: AppColor.gray200,
            width: 1.w,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          child: Obx(
            () {
              final int currentIndex = controller.currentIndex.value;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    index: 0,
                    currentIndex: currentIndex,
                    icon: Icons.home_rounded,
                    label: AppStrings.navHome.tr,
                  ),
                  _buildNavItem(
                    index: 1,
                    currentIndex: currentIndex,
                    icon: Icons.local_offer_outlined,
                    label: AppStrings.navSell.tr,
                  ),
                  _buildNavItem(
                    index: 2,
                    currentIndex: currentIndex,
                    icon: Icons.search_rounded,
                    label: AppStrings.navSearch.tr,
                  ),
                  _buildNavItem(
                    index: 3,
                    currentIndex: currentIndex,
                    icon: Icons.person_outline_rounded,
                    label: AppStrings.navProfile.tr,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required int currentIndex,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = index == currentIndex;
    final Color activeColor = AppColor.authGreen;
    final Color inactiveColor = AppColor.gray500;

    return InkWell(
      onTap: () => controller.changeIndex(index),
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24.sp,
              color: isSelected ? activeColor : inactiveColor,
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: AppFont.style(
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? activeColor : inactiveColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
