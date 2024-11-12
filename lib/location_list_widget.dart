// File: lib/widgets/location_list_widget.dart

import 'package:flutter/material.dart';
import 'package:getx_app/location_model.dart';

class LocationListWidget extends StatelessWidget {
  final List<Location> locationList;

  LocationListWidget({required this.locationList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locationList.length,
      itemBuilder: (context, index) {
        final location = locationList[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Name: ${location.locationName}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text('Address: ${location.address}'),
                Text('City: ${location.city}'),  // Ensure 'City' field is displayed
                Text('State: ${location.state}'), // Ensure 'State' field is displayed
                Text('Country: ${location.country}'), // Ensure 'Country' field is displayed
                if (location.distance != null)
                  Text('Distance: ${location.distance} km'),
                if (location.latitude != null)
                  Text('Latitude: ${location.latitude}'),
                if (location.longitude != null)
                  Text('Longitude: ${location.longitude}'),
                const SizedBox(height: 8),
                Text(
                  'Geo Fence: ${location.isIncludedInGeoFence ? "Included" : "Not Included"}',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
