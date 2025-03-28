import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:journey_to_figueira/utils/classes.dart';

class ProviderApp extends ChangeNotifier {
  List<Restaurant> get restaurant => _restaurants;
  final List<Note> _notes = [];
  final List<Restaurant> _restaurants = [
    Restaurant(
      title: "Volta \n e Maia",
      description:
          "An elegant restaurant offering refined dishes inspired by Portuguese cuisine. Features a diverse menu with fresh seafood and local wines.",
      date: "Open daily, 12:00 PM - 11:00 PM",
      image: "images/primu.jpg",
      location: LatLng(38.7169, -9.1399), // Coordinates for Volta e Maia
      menu: [
        Food(
          name: "Bacalhau à Brás",
          description:
              "A traditional Portuguese dish made with cod, potatoes, eggs, and olives.",
          price: 12.50,
          image: "images/1.jpg",
        ),
        Food(
          name: "Pastéis de Nata",
          description:
              "Famous Portuguese custard tarts made with flaky pastry and rich custard.",
          price: 3.50,
          image: "images/2.jpeg",
        ),
      ],
    ),
    Restaurant(
      title: "Puro",
      description:
          "A modern restaurant with a minimalist concept, specializing in healthy and fresh dishes, including vegan and vegetarian options.",
      date: "Open daily, 8:00 AM - 10:00 PM",
      image: "images/adoua.jpg",
      location: LatLng(38.7199, -9.1350), // Coordinates for Puro
      menu: [
        Food(
          name: "Quinoa Salad",
          description:
              "A refreshing salad made with quinoa, mixed greens, avocado, and a tangy vinaigrette.",
          price: 9.00,
          image: "images/3.jpg",
        ),
        Food(
          name: "Açaí Bowl",
          description:
              "A healthy smoothie bowl topped with granola, fruits, and honey.",
          price: 7.50,
          image: "images/4.jpg",
        ),
      ],
    ),
    Restaurant(
      title: "Trinta \n e Dois",
      description:
          "A restaurant with a relaxing atmosphere, perfect for romantic dinners or business meetings. Serves traditional dishes with a modern twist.",
      date: "Open daily, 1:00 PM - 12:00 AM",
      image: "images/atreia.jpg",
      location: LatLng(38.7245, -9.1310), // Coordinates for Trinta e Dois
      menu: [
        Food(
          name: "Robalo à Brás",
          description:
              "A variation of Bacalhau à Brás, using sea bass instead of cod.",
          price: 14.00,
          image: "images/5.jpg",
        ),
        Food(
          name: "Tarte de Amêndoa",
          description: "A delicious almond tart, perfect for dessert lovers.",
          price: 4.50,
          image: "images/6.jpg",
        ),
      ],
    ),
    Restaurant(
      title: "Zagallo",
      description:
          "A paradise for meat lovers, offering premium-quality steaks, grilled to perfection. Known for its cozy ambiance and excellent service.",
      date: "Open daily, 6:00 PM - 11:30 PM",
      image: "images/apatra.jpg",
      location: LatLng(38.7180, -9.1300), // Coordinates for Zagallo
      menu: [
        Food(
          name: "Bife de Chorizo",
          description:
              "A tender and juicy Argentine steak served with chimichurri.",
          price: 18.00,
          image: "images/7.jpg",
        ),
        Food(
          name: "Picanha",
          description:
              "A Brazilian-style grilled meat cut, served with rice and beans.",
          price: 20.00,
          image: "images/8.jpg",
        ),
      ],
    ),
    Restaurant(
      title: "Chez \n Bernardo",
      description:
          "A charming French-Portuguese fusion restaurant, offering exquisite flavors and a sophisticated dining experience.",
      date: "Open daily, 7:00 PM - 12:00 AM",
      image: "images/acincia.jpg",
      location: LatLng(38.7255, -9.1399), // Coordinates for Chez Bernardo
      menu: [
        Food(
          name: "Ratatouille",
          description:
              "A classic French vegetable dish made with zucchini, eggplant, peppers, and tomatoes.",
          price: 15.50,
          image: "images/9.jpg",
        ),
        Food(
          name: "Bacalhau à Brás",
          description:
              "Traditional Portuguese cod dish, served with potatoes, eggs, and olives.",
          price: 12.50,
          image: "images/10.jpg",
        ),
      ],
    ),
    Restaurant(
      title: "Joia",
      description:
          "A seafood restaurant famous for its fresh fish, shellfish, and delicious traditional Portuguese dishes with a touch of elegance.",
      date: "Open daily, 12:30 PM - 11:00 PM",
      image: "images/asasea.jpg",
      location: LatLng(38.7175, -9.1405), // Coordinates for Joia
      menu: [
        Food(
          name: "Arroz de Marisco",
          description:
              "Portuguese seafood rice with a variety of shellfish and fresh herbs.",
          price: 16.00,
          image: "images/11.jpg",
        ),
        Food(
          name: "Polvo à Lagareiro",
          description:
              "Octopus cooked with olive oil, garlic, and herbs, served with potatoes.",
          price: 18.50,
          image: "images/12.jpg",
        ),
      ],
    ),
    Restaurant(
      title: "Marujo",
      description:
          "A cozy, nautical-themed restaurant specializing in seafood and Mediterranean dishes, offering a warm and welcoming atmosphere.",
      date: "Open daily, 12:00 PM - 10:30 PM",
      image: "images/asaptea.jpg",
      location: LatLng(38.7230, -9.1415), // Coordinates for Marujo
      menu: [
        Food(
          name: "Sopa de Peixe",
          description:
              "A flavorful Portuguese fish soup with tomatoes, garlic, and fresh herbs.",
          price: 8.50,
          image: "images/13.avif",
        ),
        Food(
          name: "Feijoada de Mariscos",
          description:
              "A Portuguese seafood stew made with fish, shellfish, and beans.",
          price: 14.00,
          image: "images/14.jpg",
        ),
      ],
    ),
  ];
  List<Note> get notes => _notes;

  // Method to add a note
  void addNote(String text) {
    _notes.add(Note(text: text, timestamp: DateTime.now()));
  }
}
