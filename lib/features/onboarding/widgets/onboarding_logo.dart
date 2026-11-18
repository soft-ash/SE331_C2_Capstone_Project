import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/logo.png',
        width: 150.w,
        // height: 80.h,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          // Graceful fallback if asset fails to load
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.home_work_rounded,
                size: 40.sp,
                color: const Color(0xFF0C2140),
              ),
              SizedBox(height: 4.h),
              Text(
                'GhorBari',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0C2140),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
