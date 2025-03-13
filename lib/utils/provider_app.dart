import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:journey_to_figueira/utils/classes.dart';

class ProviderApp extends ChangeNotifier {
  List<Restaurant> get restaurant => _restaurants;
  List<Restaurant> _restaurants = [
    Restaurant(
      title: "Volta \n e Maia",
      description:
          "An elegant restaurant offering refined dishes inspired by Portuguese cuisine. Features a diverse menu with fresh seafood and local wines.",
      date: "Open daily, 12:00 PM - 11:00 PM",
      image: "images/primu.jpg",
      location: LatLng(38.7169, -9.1399), // Coordinates for Volta e Maia
    ),
    Restaurant(
      title: "Puro",
      description:
          "A modern restaurant with a minimalist concept, specializing in healthy and fresh dishes, including vegan and vegetarian options.",
      date: "Open daily, 8:00 AM - 10:00 PM",
      image: "images/adoua.jpg",
      location: LatLng(38.7199, -9.1350), // Coordinates for Puro
    ),
    Restaurant(
      title: "Trinta \n e Dois",
      description:
          "A restaurant with a relaxing atmosphere, perfect for romantic dinners or business meetings. Serves traditional dishes with a modern twist.",
      date: "Open daily, 1:00 PM - 12:00 AM",
      image: "images/atreia.jpg",
      location: LatLng(38.7245, -9.1310), // Coordinates for Trinta e Dois
    ),
    Restaurant(
      title: "Zagallo",
      description:
          "A paradise for meat lovers, offering premium-quality steaks, grilled to perfection. Known for its cozy ambiance and excellent service.",
      date: "Open daily, 6:00 PM - 11:30 PM",
      image: "images/apatra.jpg",
      location: LatLng(38.7180, -9.1300), // Coordinates for Zagallo
    ),
    Restaurant(
      title: "Chez \n Bernardo",
      description:
          "A charming French-Portuguese fusion restaurant, offering exquisite flavors and a sophisticated dining experience.",
      date: "Open daily, 7:00 PM - 12:00 AM",
      image: "images/acincia.jpg",
      location: LatLng(38.7255, -9.1399), // Coordinates for Chez Bernardo
    ),
    Restaurant(
      title: "Joia",
      description:
          "A seafood restaurant famous for its fresh fish, shellfish, and delicious traditional Portuguese dishes with a touch of elegance.",
      date: "Open daily, 12:30 PM - 11:00 PM",
      image: "images/a sasea.jpg",
      location: LatLng(38.7175, -9.1405), // Coordinates for Joia
    ),
    Restaurant(
      title: "Marujo",
      description:
          "A cozy, nautical-themed restaurant specializing in seafood and Mediterranean dishes, offering a warm and welcoming atmosphere.",
      date: "Open daily, 12:00 PM - 10:30 PM",
      image: "images/a saptea.jpg",
      location: LatLng(38.7230, -9.1415), // Coordinates for Marujo
    ),
  ];
}
