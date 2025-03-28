import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurant {
  String title;
  String description;
  String date;
  String image;
  LatLng location;
  List<Food> menu;

  Restaurant({
    required this.title,
    required this.description,
    required this.date,
    required this.image,
    required this.location,
    required this.menu,
  });
}

class Food {
  final String name;
  final String description;
  final double price;
  final String image;

  final List<Note> _notes = []; // Private list for notes

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class Note {
  String text;
  DateTime timestamp;

  Note({required this.text, required this.timestamp});
}
