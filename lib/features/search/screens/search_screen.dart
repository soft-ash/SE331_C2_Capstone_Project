import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/property_search_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertySearchController controller =
        Get.put(PropertySearchController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.brandNavy,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.searchProperties.tr,
          style: AppFont.style(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.brandNavy,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: AppColor.brandNavy),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              // Location Search Field
              CustomTextField(
                controller: controller.locationController,
                hintText: AppStrings.searchLocationHint.tr,
                prefixIcon: const Icon(Icons.search_rounded),
                radius: 24.r,
              ),
              SizedBox(height: 16.h),
              // Category Tags
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.categories.map((cat) {
                    return Obx(() {
                      final bool isSelected =
                          controller.selectedCategory.value == cat;
                      return GestureDetector(
                        onTap: () => controller.selectCategory(cat),
                        child: Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.authGreen
                                : AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              color: isSelected
                                  ? AppColor.authGreen
                                  : AppColor.gray200,
                              width: 1.w,
                            ),
                          ),
                          child: Text(
                            cat,
                            style: AppFont.style(
                              fontSize: 13.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                              color: isSelected
                                  ? AppColor.whiteColor
                                  : AppColor.gray800,
                            ),
                          ),
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              SizedBox(height: 24.h),
              // Price Range Section
              Text(
                AppStrings.priceRange.tr,
                style: AppFont.style(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.brandNavy,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '৳ 0',
                    style: AppFont.style(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.gray700,
                    ),
                  ),
                  Text(
                    '৳ 5,00,00,000+',
                    style: AppFont.style(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.gray700,
                    ),
                  ),
                ],
              ),
              Obx(
                () => SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColor.authGreen,
                    inactiveTrackColor: AppColor.gray200,
                    thumbColor: AppColor.whiteColor,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                      elevation: 3,
                    ),
                    overlayColor: AppColor.authGreen.withValues(alpha: 0.1),
                    trackHeight: 4,
                  ),
                  child: RangeSlider(
                    values: controller.priceRange.value,
                    min: 0,
                    max: 50000000,
                    divisions: 50,
                    onChanged: controller.updatePriceRange,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Property Type Section
              Text(
                AppStrings.propertyType.tr,
                style: AppFont.style(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.brandNavy,
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.propertyTypes.map((type) {
                  return Obx(() {
                    final bool isSelected =
                        controller.selectedPropertyType.value == type['type'];
                    return GestureDetector(
                      onTap: () => controller.selectPropertyType(type['type']!),
                      child: Container(
                        width: 72.w,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFF0FAF5)
                              : AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: isSelected
                                ? AppColor.authGreen
                                : AppColor.gray200,
                            width: 1.2.w,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              type['icon'] as IconData,
                              size: 26.sp,
                              color: isSelected
                                  ? AppColor.authGreen
                                  : AppColor.brandNavy,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              type['type'] as String,
                              style: AppFont.style(
                                fontSize: 11.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: isSelected
                                    ? AppColor.authGreen
                                    : AppColor.gray800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
              ),
              SizedBox(height: 24.h),
              // Features Section (2 columns of checkboxes)
              Text(
                AppStrings.features.tr,
                style: AppFont.style(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.brandNavy,
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        _buildFeatureCheckbox(controller, 'Parking'),
                        _buildFeatureCheckbox(controller, 'Lift'),
                        _buildFeatureCheckbox(controller, 'Garden'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        _buildFeatureCheckbox(controller, 'Gated Community'),
                        _buildFeatureCheckbox(controller, 'Air Condition'),
                        _buildFeatureCheckbox(controller, 'Security'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              // Apply Filters Button
              CustomButton(
                text: AppStrings.applyFilters.tr,
                height: 52.h,
                radius: 26.r,
                color: AppColor.authGreen,
                textColor: AppColor.whiteColor,
                prefixIcon: const Icon(Icons.filter_alt_outlined),
                onPressed: controller.applyFilters,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCheckbox(
    PropertySearchController controller,
    String feature,
  ) {
    return Obx(() {
      final bool isChecked = controller.selectedFeatures.contains(feature);
      return InkWell(
        onTap: () => controller.toggleFeature(feature),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            children: [
              SizedBox(
                width: 22.w,
                height: 22.h,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (val) => controller.toggleFeature(feature),
                  activeColor: AppColor.authGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  feature,
                  style: AppFont.style(
                    fontSize: 13.sp,
                    color: AppColor.gray700,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
