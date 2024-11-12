import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/Buttons/custombuttons%20.dart';

import 'designation_controller.dart';

class DesignationScreen extends StatelessWidget {
  DesignationScreen({Key? key}) : super(key: key);

  final DesignationController controller = Get.put(DesignationController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Designation', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[200], // Full screen background color
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32, vertical: 24),
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: isMobile ? screenWidth * 0.9 : 500,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Designation Name *',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onChanged: controller.setDesignationName,
                    ),
                    const SizedBox(height: 16),
                    Obx(() => DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Master Designation',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      items: controller.masterDesignations.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: controller.setMasterDesignation,
                    )),
                    const SizedBox(height: 24),
                    _buildButtons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return CustomButtons(
      onSavePressed: controller.saveDesignation,
      onCancelPressed: controller.cancelDesignation,
    );
  }
}
