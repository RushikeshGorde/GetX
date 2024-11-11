import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/location_model.dart';


class LocationController extends GetxController {
  
  final locationNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();


  final isIncludedInGeoFence = false.obs;

  void saveLocation() {
    if (validateForm()) {
      final location = Location(
        locationName: locationNameController.text,
        address: addressController.text,
        city: cityController.text,
        state: stateController.text,
        country: countryController.text,
        isIncludedInGeoFence: isIncludedInGeoFence.value,
      );

      //add my api here next time 
      print('Location saved: ${location.locationName}');
      
     
      Get.snackbar(
        'Success',
        'Location saved successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color(0xFFA0C8EB),
        colorText: Colors.white,
      );

      clearForm();
    }
  }

 
  bool validateForm() {
    if (locationNameController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Location Name is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    if (addressController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Address is required',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    return true;
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
    isIncludedInGeoFence.value = false;
  }

  
  @override
  void onClose() {
    locationNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    super.onClose();
  }
}
