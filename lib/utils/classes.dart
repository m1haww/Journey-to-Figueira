import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurant {
  final String title;
  final String description;
  final String date;
  final String image;
  final LatLng location;

  Restaurant({
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.location,
  });
}
