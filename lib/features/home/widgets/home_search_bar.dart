import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback onTap;

  const HomeSearchBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.h,
        padding: EdgeInsets.only(left: 16.w, right: 6.w),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(26.r),
          border: Border.all(
            color: AppColor.gray200,
            width: 1.2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: AppColor.gray400,
              size: 20.sp,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                AppStrings.searchPropertiesHint.tr,
                style: AppFont.style(
                  fontSize: 14.sp,
                  color: AppColor.gray400,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                color: AppColor.authGreen,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_rounded,
                color: AppColor.whiteColor,
                size: 20.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
