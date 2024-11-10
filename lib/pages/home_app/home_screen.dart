import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_connect/controllers/signin_controller.dart';
import 'package:trip_connect/globle/pallet.dart';
import 'package:trip_connect/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SignInController signInController = Get.find();

  final HomeController homeController = Get.find();

  final LatLng _pGooglePlex = const LatLng(37.4223, -122.0848);
  final LatLng _pApplePark = const LatLng(37.3346, -122.0090);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: appBar(),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: homeController.setMapStyle,
            initialCameraPosition:
                CameraPosition(target: _pGooglePlex, zoom: 13),
            markers: {
              Marker(
                markerId: const MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pGooglePlex,
              ),
              Marker(
                markerId: const MarkerId("_sourceLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _pApplePark,
              )
            },
          ),
          Obx(
            () => AnimatedContainer(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 55,
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: blackColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        homeController.isGroupTab.value = true;
                      },
                      child: tabcard(
                        "Group Trips",
                        homeController.isGroupTab.value,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        homeController.isGroupTab.value = false;
                      },
                      child: tabcard(
                        "Solo Trips",
                        !homeController.isGroupTab.value,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: scaffoldBackgroundColor,
      foregroundColor: scaffoldBackgroundColor,
      surfaceTintColor: scaffoldBackgroundColor,
      centerTitle: false,
      title: Text(
        "TripConnect",
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.26,
          color: secondaryColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: secondaryColor,
            child: SvgPicture.asset(
              'assets/icons/notification-bell-new.svg',
              height: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget tabcard(String title, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? secondaryColor : blackColor,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.26,
            color: isActive ? whiteColor : const Color(0XFFD6D6D6),
          ),
        ),
      ),
    );
  }
}
