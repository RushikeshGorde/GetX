import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Buttons/custombuttons%20.dart';
// import 'package:getx_app/Buttons/custombuttons%20.dart';
import 'package:getx_app/locationcontroller.dart';

class LocationWithoutIcon extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Location',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Get.back(),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMainForm(screenWidth),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isIncludedInGeoFence.value,
                          onChanged: (value) {
                            controller.toggleGeoFenceForm(value);
                          },
                          activeColor: Colors.blue,
                        ),
                      ),
                      const Text(
                        'Is Included in Geo Fence Employee Logs',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildGeoFenceSection(screenWidth),
                  const SizedBox(height: 24),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainForm(double screenWidth) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildTextField(
                controller: controller.locationNameController,
                label: 'Location Name *',
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 2,
              child: _buildTextField(
                controller: controller.cityController,
                label: 'City',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildTextField(
                controller: controller.addressController,
                label: 'Address *',
                maxLines: 4,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildTextField(
                    controller: controller.stateController,
                    label: 'State',
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(
                    controller: controller.countryController,
                    label: 'Country',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGeoFenceSection(double screenWidth) {
    return Obx(() => controller.isGeoFenceFormVisible.value
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                child: Text(
                  '(Allowed Distance From Center of Location To Mark Employee Punch In/Out)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Row(
                children: [
                  // Distance field with dynamic width
                  SizedBox(
                    width: screenWidth > 600 ? 570 : screenWidth * 0.4,
                    child: _buildTextField(
                      controller: controller.distanceController,
                      label: 'Distance',
                      suffix: Text(
                        '(in meters)',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Latitude field with dynamic width
                  SizedBox(
                    width: screenWidth > 600 ? 570 : screenWidth * 0.4,
                    child: _buildTextField(
                      controller: controller.latitudeController,
                      label: 'Latitude',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Longitude field with dynamic width
              SizedBox(
                width: screenWidth > 600 ? 570 : screenWidth * 0.4,
                child: _buildTextField(
                  controller: controller.longitudeController,
                  label: 'Longitude',
                ),
              ),
            ],
          )
        : const SizedBox.shrink());
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
    Widget? suffix,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        suffix: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildButtons() {
    return CustomButtons(
      onSavePressed: controller.saveLocation,
      onCancelPressed: controller.cancelForm,
    );
  }
}
