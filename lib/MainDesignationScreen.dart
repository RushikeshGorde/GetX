import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/designation.dart'; // Assuming this is the screen for the form
// import 'package:getx_app/designation_screen.dart'; // If you have the screen in another file
import 'designation_controller.dart';

class MainDesignationScreen extends StatelessWidget {
  final DesignationController controller = Get.put(DesignationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Designations'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Position the button at the top-right with better styling
              Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: () => _showSmallDesignationDialog(context),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between button and list
              Expanded(
                child: ListView.builder(
                  itemCount: controller.masterDesignations.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        title: Text(controller.masterDesignations[index]),
                        subtitle: Text(
                            'Master Designation: ${controller.masterDesignations[index]}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // Handle edit action
                                _showEditDialog(context, index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Handle delete action
                                _deleteDesignation(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show the small designation form in a dialog with smaller width and height
  void _showSmallDesignationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),  // Adjusted padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 600,  // Set a fixed width for the dialog
            height: 400, // Adjusted dialog height
            child: DesignationScreen(),
          ),
        );
      },
    );
  }

  // Handle edit action
  void _showEditDialog(BuildContext context, int index) {
    // You can prepopulate the form with the data of the selected item for editing.
    final designationName = controller.masterDesignations[index];
    controller.setDesignationName(designationName);

    // Show the dialog to edit the designation with smaller size
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 100),  // Adjusted padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: 600,  // Set a fixed width for the dialog
            height: 400, // Adjusted dialog height
            child: DesignationScreen(),
          ),
        );
      },
    );
  }

  // Handle delete action
  void _deleteDesignation(int index) {
    // Remove designation from the list (this is just an example, modify it based on your backend logic)
    controller.masterDesignations.removeAt(index);
    Get.snackbar('Success', 'Designation deleted successfully',
        snackPosition: SnackPosition.BOTTOM);
  }
}
