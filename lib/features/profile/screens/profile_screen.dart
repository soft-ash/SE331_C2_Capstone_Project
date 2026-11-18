import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/font/font.dart';
import '../../../core/localization/app_strings.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.myProfile.tr,
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
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // User Avatar & Name Card
              Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColor.gray200,
                    width: 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColor.authGreenLight,
                      child: Text(
                        'R',
                        style: AppFont.style(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColor.authGreen,
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.userName.value,
                            style: AppFont.style(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColor.brandNavy,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            controller.userEmail.value,
                            style: AppFont.style(
                              fontSize: 13.sp,
                              color: AppColor.gray500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildMenuItem(
                icon: Icons.holiday_village_outlined,
                title: AppStrings.myProperties.tr,
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.favorite_border_rounded,
                title: AppStrings.savedProperties.tr,
                onTap: () {},
              ),
              Obx(
                () => _buildMenuItem(
                  icon: Icons.language_rounded,
                  title: controller.isBengali.value
                      ? 'Language: বাংলা'
                      : 'Language: English',
                  trailing: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColor.authGreenLight,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      controller.isBengali.value ? 'EN' : 'বাংলা',
                      style: AppFont.style(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.authGreen,
                      ),
                    ),
                  ),
                  onTap: controller.toggleLanguage,
                ),
              ),
              _buildMenuItem(
                icon: Icons.settings_outlined,
                title: AppStrings.settings.tr,
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.logout_rounded,
                title: AppStrings.logout.tr,
                iconColor: AppColor.error500,
                textColor: AppColor.error500,
                onTap: controller.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    Color? iconColor,
    Color? textColor,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: AppColor.gray200,
          width: 1.w,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap,
          leading: Icon(
            icon,
            color: iconColor ?? AppColor.brandNavy,
            size: 22.sp,
          ),
          title: Text(
            title,
            style: AppFont.style(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColor.brandNavy,
            ),
          ),
          trailing: trailing ??
              Icon(
                Icons.chevron_right_rounded,
                color: AppColor.gray400,
                size: 20.sp,
              ),
        ),
      ),
    );
  }
}
