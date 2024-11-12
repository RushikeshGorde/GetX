// designation_controller.dart

import 'package:get/get.dart';
import 'designation_model.dart';

class DesignationController extends GetxController {
  final designation = DesignationModel().obs;
  final masterDesignations = <String>[
    'Senior Manager',
    'Manager',
    'Team Lead',
    'Developer',
    'Intern'
  ].obs;

  void setDesignationName(String value) => designation.update((val) {
    val?.designationName = value;
  });

  void setMasterDesignation(String? value) => designation.update((val) {
    val?.masterDesignation = value;
  });

  void saveDesignation() {
    if (designation.value.designationName?.isEmpty ?? true) {
      Get.snackbar('Error', 'Designation name is required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    Get.snackbar('Success', 'Designation saved successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  void cancelDesignation() {
    designation.value = DesignationModel();
    Get.back();
  }
}
