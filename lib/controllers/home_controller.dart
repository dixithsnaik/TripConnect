import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  RxBool isGroupTab = true.obs;

  late GoogleMapController _controller;
  GoogleMapController? mapController;
  void moveToPosition(LatLng target) {
    if (mapController != null) {
      mapController!.animateCamera(
          CameraUpdate.newLatLng(target)); // Move camera to the target position
    }
  }
}
