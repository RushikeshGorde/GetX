import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Buttons/custombuttons%20.dart';
// import 'package:getx_app/Buttons/custombuttons.dart';
import 'package:getx_app/LocationController.dart';

class LocationView extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Location',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xFFA0C8EB), // Updated color
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA0C8EB), // Updated color
              Color(0xFFD4E6F7), // Lighter shade of the color
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Container(
                  width: constraints.maxWidth > 1200
                      ? 1200
                      : constraints.maxWidth > 600
                          ? constraints.maxWidth * 0.9
                          : constraints.maxWidth,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (constraints.maxWidth > 600)
                            _buildDesktopLayout(constraints)
                          else
                            _buildMobileLayout(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildTextField(
                controller: controller.locationNameController,
                label: 'Location Name *',
                icon: Icons.location_on,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: buildTextField(
                controller: controller.cityController,
                label: 'City',
                icon: Icons.location_city,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        buildTextArea(
          controller: controller.addressController,
          label: 'Address *',
          icon: Icons.home,
        ),
        const SizedBox(height: 16.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: buildTextField(
                controller: controller.stateController,
                label: 'State',
                icon: Icons.map,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: buildTextField(
                controller: controller.countryController,
                label: 'Country',
                icon: Icons.public,
              ),
            ),
          ],
        ),
        _buildCommonElements(),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        buildTextField(
          controller: controller.locationNameController,
          label: 'Location Name *',
          icon: Icons.location_on,
        ),
        const SizedBox(height: 16.0),
        buildTextArea(
          controller: controller.addressController,
          label: 'Address *',
          icon: Icons.home,
        ),
        const SizedBox(height: 16.0),
        buildTextField(
          controller: controller.cityController,
          label: 'City',
          icon: Icons.location_city,
        ),
        const SizedBox(height: 16.0),
        buildTextField(
          controller: controller.stateController,
          label: 'State',
          icon: Icons.map,
        ),
        const SizedBox(height: 16.0),
        buildTextField(
          controller: controller.countryController,
          label: 'Country',
          icon: Icons.public,
        ),
        _buildCommonElements(),
      ],
    );
  }

  Widget _buildCommonElements() {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Obx(
            () => Row(
              children: [
                Checkbox(
                  value: controller.isIncludedInGeoFence.value,
                  onChanged: (value) {
                    controller.isIncludedInGeoFence.value = value ?? false;
                  },
                  activeColor: Color(0xFFA0C8EB), // Updated color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 5),
                const Expanded(
                  child: Text(
                    'Is Included in Geo Fence Employee Logs',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24.0),
        CustomButtons(
          onSavePressed: () => controller.saveLocation(),
          onCancelPressed: () => controller.cancelForm(),
        ),
      ],
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade50,
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Icon(icon, color: Color(0xFFA0C8EB)), // Updated color
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA0C8EB), width: 2), // Updated color
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }

  Widget buildTextArea({
    required TextEditingController controller,
    required String label,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade50,
      ),
      child: TextFormField(
        controller: controller,
        minLines: 1,
        maxLines: 400,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.grey.shade700),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Icon(icon, color: Color(0xFFA0C8EB)), // Updated color
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFA0C8EB), width: 2), // Updated color
          ),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
