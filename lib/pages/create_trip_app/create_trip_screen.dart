import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_connect/controllers/map_controller.dart';
import 'package:trip_connect/globle/pallet.dart';

class CreateTripScreen extends StatelessWidget {
  CreateTripScreen({super.key});
  final MapController mapController = Get.find();
  final LatLng _pGooglePlex = const LatLng(37.4223, -122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: GoogleMap(
        onMapCreated: mapController.setMapStyle,
        initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 13),
        zoomControlsEnabled: false,
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          hintText: 'Choose Location',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
