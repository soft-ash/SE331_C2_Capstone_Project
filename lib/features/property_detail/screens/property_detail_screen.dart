import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../controllers/property_detail_controller.dart';

class PropertyDetailScreen extends StatelessWidget {
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyDetailController controller =
        Get.put(PropertyDetailController());
    final property = controller.property;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          // Scrollable Body
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Hero Image Section
                Stack(
                  children: [
                    Container(
                      height: 310.h,
                      width: double.infinity,
                      color: AppColor.gray100,
                      child: Image.asset(
                        property.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ),
                    ),
                    // Action Buttons on Image
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCircleButton(
                              icon: Icons.arrow_back_ios_new_rounded,
                              onTap: () => Get.back(),
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => _buildCircleButton(
                                    icon: controller.isFavorite.value
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    iconColor: controller.isFavorite.value
                                        ? AppColor.error500
                                        : AppColor.gray800,
                                    onTap: controller.toggleFavorite,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                _buildCircleButton(
                                  icon: Icons.share_outlined,
                                  onTap: controller.shareProperty,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Photo index indicator (1/8)
                    Positioned(
                      bottom: 30.h,
                      right: 20.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '1/8',
                          style: AppFont.style(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Curved Details Card
                Transform.translate(
                  offset: Offset(0, -20.h),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.r),
                        topRight: Radius.circular(28.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Purpose Badge
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.authGreen,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            property.purpose,
                            style: AppFont.style(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        // Price
                        Text(
                          property.formattedPrice,
                          style: AppFont.style(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.authGreen,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        // Title
                        Text(
                          property.title,
                          style: AppFont.style(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.brandNavy,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        // Location
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.sp,
                              color: AppColor.authGreen,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              property.location,
                              style: AppFont.style(
                                fontSize: 13.sp,
                                color: AppColor.gray700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        // Specs Row: Beds, Baths, Sqft
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSpecCard(
                              icon: Icons.hotel_outlined,
                              value: '${property.beds}',
                              label: AppStrings.beds.tr,
                            ),
                            _buildSpecCard(
                              icon: Icons.bathtub_outlined,
                              value: '${property.baths}',
                              label: AppStrings.baths.tr,
                            ),
                            _buildSpecCard(
                              icon: Icons.square_foot_rounded,
                              value: '${property.sqft}',
                              label: AppStrings.sqft.tr,
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        // Description Section
                        Text(
                          AppStrings.description.tr,
                          style: AppFont.style(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColor.brandNavy,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Text(
                            property.description,
                            maxLines:
                                controller.isDescriptionExpanded.value ? 20 : 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppFont.style(
                              fontSize: 13.sp,
                              color: AppColor.brandSubtitle,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: controller.toggleDescription,
                          child: Obx(
                            () => Text(
                              controller.isDescriptionExpanded.value
                                  ? '${AppStrings.readLess.tr} ↑'
                                  : '${AppStrings.readMore.tr} ↓',
                              style: AppFont.style(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.authGreen,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 90.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Fixed Bottom Bar with Call and Message
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
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
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: CustomButton(
                        text: AppStrings.call.tr,
                        height: 50.h,
                        radius: 25.r,
                        color: AppColor.whiteColor,
                        border: Border.all(
                          color: AppColor.gray300,
                          width: 1.2.w,
                        ),
                        textColor: AppColor.authGreen,
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: AppColor.authGreen,
                        ),
                        onPressed: controller.callAgent,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      flex: 5,
                      child: CustomButton(
                        text: AppStrings.message.tr,
                        height: 50.h,
                        radius: 25.r,
                        color: AppColor.authGreen,
                        textColor: AppColor.whiteColor,
                        prefixIcon: const Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: AppColor.whiteColor,
                        ),
                        onPressed: controller.messageAgent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton({
    required IconData icon,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: iconColor ?? AppColor.brandNavy,
        ),
      ),
    );
  }

  Widget _buildSpecCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.gray200,
          width: 1.w,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 24.sp,
            color: AppColor.brandNavy,
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: AppFont.style(
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
              color: AppColor.brandNavy,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: AppFont.style(
              fontSize: 11.sp,
              color: AppColor.gray500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
