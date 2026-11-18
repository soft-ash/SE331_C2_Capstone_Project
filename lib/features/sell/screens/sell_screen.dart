import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../controllers/sell_controller.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SellController controller = Get.put(SellController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.listProperty.tr,
          style: AppFont.style(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: AppColor.brandNavy,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                // Purpose Selector (For Sale / For Rent)
                Row(
                  children: controller.purposes.map((p) {
                    return Expanded(
                      child: Obx(() {
                        final bool isSelected =
                            controller.selectedPurpose.value == p;
                        return GestureDetector(
                          onTap: () => controller.selectedPurpose.value = p,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColor.authGreen
                                  : AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(20.r),
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.authGreen
                                    : AppColor.gray300,
                                width: 1.2.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                p,
                                style: AppFont.style(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColor.whiteColor
                                      : AppColor.gray800,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  controller: controller.titleController,
                  hintText: 'Property Title (e.g. Modern Duplex House)',
                  prefixIcon: const Icon(Icons.title_rounded),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter property title'
                      : null,
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: controller.priceController,
                  hintText: 'Price in BDT (৳)',
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.attach_money_rounded),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter price'
                      : null,
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: controller.locationController,
                  hintText: 'Location (e.g. Gulshan, Dhaka)',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Please enter location'
                      : null,
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: controller.areaController,
                        hintText: 'Area (sqft)',
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.square_foot_rounded),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.bedsController,
                        hintText: 'Beds',
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.hotel_outlined),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: CustomTextField(
                        controller: controller.bathsController,
                        hintText: 'Baths',
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(Icons.bathtub_outlined),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomTextField(
                  controller: controller.descriptionController,
                  hintText: 'Property description and highlights...',
                  prefixIcon: const Icon(Icons.description_outlined),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: AppStrings.submitListing.tr,
                  height: 52.h,
                  radius: 26.r,
                  color: AppColor.authGreen,
                  textColor: AppColor.whiteColor,
                  prefixIcon: const Icon(Icons.add_circle_outline_rounded),
                  onPressed: controller.submitListing,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
