class Location {
  String locationName;
  String address;
  String city;
  String state;
  String country;
  bool isIncludedInGeoFence;

  Location({
    required this.locationName,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.isIncludedInGeoFence,
  });
}
