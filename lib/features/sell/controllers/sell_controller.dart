import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/images.dart';
import '../../../core/logger/app_logger.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/models/property_model.dart';

class SellController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController titleController;
  late final TextEditingController priceController;
  late final TextEditingController locationController;
  late final TextEditingController areaController;
  late final TextEditingController bedsController;
  late final TextEditingController bathsController;
  late final TextEditingController descriptionController;

  final RxString selectedPurpose = 'For Sale'.obs;
  final RxString selectedType = 'Apartment'.obs;

  final List<String> purposes = const ['For Sale', 'For Rent'];
  final List<String> types = const ['Apartment', 'House', 'Duplex', 'Plot'];

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    priceController = TextEditingController();
    locationController = TextEditingController();
    areaController = TextEditingController();
    bedsController = TextEditingController();
    bathsController = TextEditingController();
    descriptionController = TextEditingController();
    AppLogger.info('SellController initialized');
  }

  void submitListing() {
    if (formKey.currentState?.validate() ?? false) {
      final newProperty = PropertyModel(
        id: 'prop-${DateTime.now().millisecondsSinceEpoch}',
        title: titleController.text.trim(),
        type: selectedType.value,
        purpose: selectedPurpose.value,
        price: double.tryParse(priceController.text.trim()) ?? 0,
        formattedPrice: '৳ ${priceController.text.trim()}',
        location: locationController.text.trim(),
        beds: int.tryParse(bedsController.text.trim()) ?? 3,
        baths: int.tryParse(bathsController.text.trim()) ?? 2,
        sqft: int.tryParse(areaController.text.trim()) ?? 1200,
        description: descriptionController.text.trim(),
        image: AppImages.onboarding1,
        images: [AppImages.onboarding1],
      );

      // Add to home featured properties if controller registered
      if (Get.isRegistered<HomeController>()) {
        Get.find<HomeController>().featuredProperties.insert(0, newProperty);
      }

      AppLogger.success('New property listed: ${newProperty.title}');
      Get.snackbar(
        'Success',
        'Your property has been listed successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Clear form
      titleController.clear();
      priceController.clear();
      locationController.clear();
      areaController.clear();
      bedsController.clear();
      bathsController.clear();
      descriptionController.clear();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    priceController.dispose();
    locationController.dispose();
    areaController.dispose();
    bedsController.dispose();
    bathsController.dispose();
    descriptionController.dispose();
    AppLogger.info('SellController disposed');
    super.onClose();
  }
}
