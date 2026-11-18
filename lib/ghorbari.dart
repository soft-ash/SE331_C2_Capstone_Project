import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import 'core/constants/colors.dart';
import 'core/font/font.dart';
import 'core/localization/app_translations.dart';
import 'features/routes/app_pages.dart';

class Ghorbari extends StatelessWidget {
  const Ghorbari({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'GhorBari',
          debugShowCheckedModeBanner: false,
          translations: AppTranslations(),
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: AppFont.textTheme(),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColor.brandTeal,
              primary: AppColor.brandNavy,
            ),
            scaffoldBackgroundColor: AppColor.whiteColor,
          ),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
