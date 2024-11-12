import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/location.dart';
import 'package:getx_app/locationcontroller.dart';
// import 'package:getx_app/location_form.dart'; // Import the LocationWithoutIcon form page

class LocationListPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location List'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add some padding
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Use Navigator.push() for navigation
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationWithoutIcon(), // Navigate to the form page
                  ),
                );
              },
              iconSize: 30, // Adjust icon size if necessary
            ),
          ),
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.locationList.length,
          itemBuilder: (context, index) {
            final location = controller.locationList[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(location.locationName),
                subtitle: Text(location.address),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        controller.locationNameController.text = location.locationName;
                        controller.addressController.text = location.address;
                        // Add more fields if needed
                        // Use Navigator.push() for navigation
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationWithoutIcon(), // Navigate to the form page
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Handle delete logic
                        controller.locationList.removeAt(index); // Remove the item from the list
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
