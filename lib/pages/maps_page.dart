import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:journey_to_figueira/pages/maps_details.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/classes.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  List<Restaurant> _restaurants = [
    Restaurant(
      title: "Volta e Maia",
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
      title: "Trinta e Dois",
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
      title: "Chez Bernardo",
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

  // Set an initial zoom level
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(38.7169, -9.1399), // Example: Portugal coordinates
    zoom: 14.0, // Set zoom level
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Add markers for each restaurant
    _addMarkers();
  }

  //controler
  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  void _addMarkers() {
    for (var restaurant in _restaurants) {
      final marker = Marker(
        markerId: MarkerId(restaurant.title),

        position: restaurant.location,
        onTap: () {
          _showRestaurantInfo(restaurant);
        },

        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueOrange,
        ), // Gold marker
      );
      setState(() {
        _markers.add(marker);
      });
    }
  }

  void _showRestaurantInfo(Restaurant restaurant) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant.description,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
                SizedBox(height: 8),
                Text(
                  restaurant.date,
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.amber),
                    child: Text("Open"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder:
                              (context) => MapsDetails(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: buildTextAppbar(context, "Maps"),
            backgroundColor: Colors.transparent,
            centerTitle: false,
          ),
          body: SafeArea(
            child: GoogleMap(
              myLocationButtonEnabled: false,
              initialCameraPosition:
                  _initialPosition, // Set initial camera position
              onMapCreated: _onMapCreated,
              markers: _markers, // Show the markers on the map
              zoomControlsEnabled:
                  false, // Optionally disable default zoom controls
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Zoom In Button
              FloatingActionButton(
                onPressed: () {
                  if (mapController != null) {
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(38.7169, -9.1399),
                          zoom: 16.0, // Zoom in (higher zoom level)
                        ),
                      ),
                    );
                  }
                },
                child: Icon(Icons.zoom_in),
                heroTag: "zoomIn",
              ),
              SizedBox(height: 10),
              // Zoom Out Button
              FloatingActionButton(
                onPressed: () {
                  if (mapController != null) {
                    mapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: LatLng(38.7169, -9.1399),
                          zoom: 12.0, // Zoom out (lower zoom level)
                        ),
                      ),
                    );
                  }
                },
                child: Icon(Icons.zoom_out),
                heroTag: "zoomOut",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
