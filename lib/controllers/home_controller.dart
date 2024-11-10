import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  RxBool isGroupTab = true.obs;

  late GoogleMapController _controller;

  final String _mapStyle = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e0e0e0"  // Grey for all land areas and buildings
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"  // Hide icons for a cleaner look
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"  // Grey for text labels
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#ffffff"  // White stroke for text labels
      }
    ]
  },
  {
    "featureType": "administrative",
    "elementType": "geometry.fill",
    "stylers": [
      {
        "color": "#d6d6d6"  // Light grey for administrative areas
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#cccccc"  // Grey for points of interest and buildings
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"  // White for all roads
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"  // White for major arterial roads
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"  // White for highways
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"  // White for local roads
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e0e0e0"  // Grey for transit lines and stations
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#aacffa"  // Light blue for water
      }
    ]
  }
]''';

  // Method to set the map style
  void setMapStyle(GoogleMapController controller) {
    _controller = controller;
    _controller.setMapStyle(_mapStyle); // Set the custom map style
  }
}
