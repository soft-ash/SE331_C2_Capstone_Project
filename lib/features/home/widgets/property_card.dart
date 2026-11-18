import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../models/property_model.dart';

class PropertyCard extends StatelessWidget {
  final PropertyModel property;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const PropertyCard({
    super.key,
    required this.property,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColor.gray200,
            width: 1.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: 125.w,
                height: 95.h,
                color: AppColor.gray100,
                child: Image.asset(
                  property.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.home, color: AppColor.gray400),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            // Property Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.authGreen,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          property.purpose,
                          style: AppFont.style(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onFavoriteToggle,
                        child: Icon(
                          property.isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 20.sp,
                          color: property.isFavorite
                              ? AppColor.error500
                              : AppColor.gray400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    property.formattedPrice,
                    style: AppFont.style(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.brandNavy,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${property.beds} Bed • ${property.baths} Bath • ${property.sqft} sqft',
                    style: AppFont.style(
                      fontSize: 11.sp,
                      color: AppColor.gray500,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14.sp,
                        color: AppColor.authGreen,
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Text(
                          property.location,
                          overflow: TextOverflow.ellipsis,
                          style: AppFont.style(
                            fontSize: 12.sp,
                            color: AppColor.gray700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
