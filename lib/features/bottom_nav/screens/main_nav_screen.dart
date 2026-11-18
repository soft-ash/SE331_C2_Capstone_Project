import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/screens/home_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../search/screens/search_screen.dart';
import '../../sell/screens/sell_screen.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class MainNavScreen extends StatelessWidget {
  const MainNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    final List<Widget> pages = const [
      HomeScreen(),
      SellScreen(),
      SearchScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(controller: controller),
    );
  }
}
