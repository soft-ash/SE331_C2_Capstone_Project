import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../models/onboarding_item_model.dart';
import 'curved_underline_painter.dart';
import 'onboarding_logo.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingItemModel item;

  const OnboardingPageItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.isImageAtBottom) {
      return _buildIntroLayout();
    } else {
      return _buildFeatureLayout();
    }
  }

  /// Layout for Slide 1: Logo & Text on top, House illustration at the bottom
  Widget _buildIntroLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  const OnboardingLogo(),
                  SizedBox(height: 12.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: _buildHeading(),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      item.descriptionKey.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.brandSubtitle,
                        height: 1.45,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Layout for Slide 2 & 3: Illustration at the top, Heading & Text below
  Widget _buildFeatureLayout() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.r),
                          bottomRight: Radius.circular(32.r),
                        ),
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) =>
                              const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildHeading(),
                        SizedBox(height: 8.h),
                        Text(
                          item.descriptionKey.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.brandSubtitle,
                            height: 1.45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeading() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: item.titlePart1Key.tr,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.brandNavy,
              letterSpacing: -0.3,
            ),
          ),
          if (item.titlePart2Key.isNotEmpty)
            TextSpan(
              text: item.titlePart2Key.tr,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.brandNavy,
                letterSpacing: -0.3,
              ),
            ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.titleHighlightKey.tr,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColor.brandTeal,
                    letterSpacing: -0.3,
                  ),
                ),
                if (item.hasUnderlineAccent)
                  SizedBox(
                    width: 65.w,
                    height: 5.h,
                    child: const CustomPaint(
                      painter: CurvedUnderlinePainter(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
