import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_banner_slider.dart';
import '../widgets/home_category_pills.dart';
import '../widgets/home_header.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/property_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              HomeHeader(controller: controller),
              SizedBox(height: 16.h),
              // Greeting
              Text(
                AppStrings.helloUser.tr,
                style: AppFont.style(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColor.brandNavy,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppStrings.findDreamProperty.tr,
                style: AppFont.style(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.brandSubtitle,
                ),
              ),
              SizedBox(height: 16.h),
              HomeSearchBar(onTap: controller.onSearchTap),
              SizedBox(height: 18.h),
              HomeBannerSlider(controller: controller),
              SizedBox(height: 16.h),
              HomeCategoryPills(controller: controller),
              SizedBox(height: 20.h),
              // Section Title: Featured Properties
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      AppStrings.featuredProperties.tr,
                      style: AppFont.style(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.brandNavy,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: controller.onSearchTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.seeAll.tr,
                          style: AppFont.style(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.authGreen,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14.sp,
                          color: AppColor.authGreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              // Properties List
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.featuredProperties.length,
                  itemBuilder: (context, index) {
                    final property = controller.featuredProperties[index];
                    return PropertyCard(
                      property: property,
                      onTap: () => controller.openPropertyDetail(property),
                      onFavoriteToggle: () =>
                          controller.toggleFavorite(property.id),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
