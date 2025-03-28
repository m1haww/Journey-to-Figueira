import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:journey_to_figueira/pages/maps_details.dart';
import 'package:journey_to_figueira/utils/base.dart';
import 'package:journey_to_figueira/utils/classes.dart';
import 'package:journey_to_figueira/utils/provider_app.dart';
import 'package:provider/provider.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

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
    final provider = Provider.of<ProviderApp>(context, listen: false);
    for (var restaurant in provider.restaurant) {
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
        ),
      ],
    );
  }
}
