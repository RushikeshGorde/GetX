// File: lib/controllers/location_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/location_model.dart'; // Assuming you have this model for Location

class LocationController extends GetxController {
  final locationNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final distanceController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();

  // Observable state variables
  final isIncludedInGeoFence = false.obs;
  final isGeoFenceFormVisible = false.obs;

  // Dummy list with 10 locations in Pune, Maharashtra
  var locationList = <Location>[
    Location(
      locationName: 'Pune Station',
      address: 'Railway Station Rd',
      city: 'Pune',
      state: 'Maharashtra',
      country: 'India',
      distance: 5,
      latitude: 18.5289,
      longitude: 73.8745,
    ),
    // ... other Location items as in your original code ...
  ].obs;

  // Save location form data
  void saveLocation() {
    if (validateForm()) {
      final location = Location(
        locationName: locationNameController.text,
        address: addressController.text,
        city: cityController.text,
        state: stateController.text,
        country: countryController.text,
        isIncludedInGeoFence: isIncludedInGeoFence.value,
        distance: isIncludedInGeoFence.value ? int.tryParse(distanceController.text) : null,
        latitude: isIncludedInGeoFence.value ? double.tryParse(latitudeController.text) : null,
        longitude: isIncludedInGeoFence.value ? double.tryParse(longitudeController.text) : null,
      );

      locationList.add(location);  // Add to the list
      Get.snackbar(
        'Success',
        'Location saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      clearForm();
    }
  }

  void toggleGeoFenceForm(bool? value) {
    isIncludedInGeoFence.value = value ?? false;
    isGeoFenceFormVisible.value = isIncludedInGeoFence.value;
  }

  bool validateForm() {
    if (locationNameController.text.isEmpty) {
      _showError('Location Name is required');
      return false;
    }
    if (addressController.text.isEmpty) {
      _showError('Address is required');
      return false;
    }
    if (isIncludedInGeoFence.value) {
      if (distanceController.text.isEmpty) {
        _showError('Distance is required for Geo Fence');
        return false;
      }
      if (latitudeController.text.isEmpty || longitudeController.text.isEmpty) {
        _showError('Latitude and Longitude are required for Geo Fence');
        return false;
      }
    }
    return true;
  }

  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void cancelForm() {
    clearForm();
    Get.back();
  }

  void clearForm() {
    locationNameController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    distanceController.clear();
    latitudeController.clear();
    longitudeController.clear();
    isIncludedInGeoFence.value = false;
    isGeoFenceFormVisible.value = false;
  }

  @override
  void onClose() {
    locationNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    distanceController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.onClose();
  }
}
