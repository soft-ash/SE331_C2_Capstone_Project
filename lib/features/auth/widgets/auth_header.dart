import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../core/constants/colors.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.brandNavy,
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          subtitle,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.brandSubtitle,
            height: 1.45,
          ),
        ),
      ],
    );
  }
}
