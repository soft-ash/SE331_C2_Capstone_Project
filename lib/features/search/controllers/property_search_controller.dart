import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/logger/app_logger.dart';

class PropertySearchController extends GetxController {
  late final TextEditingController locationController;

  final RxString selectedCategory = 'All'.obs;
  final Rx<RangeValues> priceRange =
      const RangeValues(0, 50000000).obs;
  final RxString selectedPropertyType = 'Apartment'.obs;
  final RxList<String> selectedFeatures = <String>['Parking'].obs;

  final List<String> categories = const [
    'All',
    'Apartment',
    'Duplex',
    'House',
    'Plot',
  ];

  final List<Map<String, dynamic>> propertyTypes = const [
    {'type': 'House', 'icon': Icons.home_outlined},
    {'type': 'Apartment', 'icon': Icons.apartment_rounded},
    {'type': 'Duplex', 'icon': Icons.holiday_village_outlined},
    {'type': 'Plot', 'icon': Icons.local_offer_outlined},
  ];

  final List<String> allFeatures = const [
    'Parking',
    'Gated Community',
    'Lift',
    'Air Condition',
    'Garden',
    'Security',
  ];

  @override
  void onInit() {
    super.onInit();
    locationController = TextEditingController();
    AppLogger.info('PropertySearchController initialized');
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void updatePriceRange(RangeValues values) {
    priceRange.value = values;
  }

  void selectPropertyType(String type) {
    selectedPropertyType.value = type;
  }

  void toggleFeature(String feature) {
    if (selectedFeatures.contains(feature)) {
      selectedFeatures.remove(feature);
    } else {
      selectedFeatures.add(feature);
    }
  }

  void applyFilters() {
    AppLogger.success(
      'Filters applied: type=${selectedPropertyType.value}, range=${priceRange.value}, features=$selectedFeatures',
    );
    Get.back();
  }

  @override
  void onClose() {
    locationController.dispose();
    AppLogger.info('PropertySearchController disposed');
    super.onClose();
  }
}
