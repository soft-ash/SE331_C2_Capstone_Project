import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../controllers/home_controller.dart';

class HomeCategoryPills extends StatelessWidget {
  final HomeController controller;

  const HomeCategoryPills({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'key': 'Buy', 'label': AppStrings.buy.tr},
      {'key': 'Sell', 'label': AppStrings.sell.tr},
      {'key': 'Search Manually', 'label': AppStrings.searchManually.tr},
      {'key': 'AI Search', 'label': AppStrings.aiSearch.tr},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          return Obx(() {
            final bool isSelected =
                controller.selectedCategory.value == cat['key'];
            return GestureDetector(
              onTap: () => controller.selectCategory(cat['key']!),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColor.authGreen : AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color:
                        isSelected ? AppColor.authGreen : AppColor.gray200,
                    width: 1.w,
                  ),
                  boxShadow: [
                    if (!isSelected)
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                  ],
                ),
                child: Text(
                  cat['label']!,
                  style: AppFont.style(
                    fontSize: 13.sp,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color:
                        isSelected ? AppColor.whiteColor : AppColor.gray800,
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
