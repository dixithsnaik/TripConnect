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
      backgroundColor: blackColor,
      appBar: appBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        ],
        currentIndex: 0, // Keep this consistent
        onTap: (index) {}, // No actions needed
        selectedItemColor: Colors.transparent,
        unselectedItemColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0, // Removes shadow
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: 55.0,
        height: 55.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color(0XFF9DB2CE),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: SvgPicture.asset(
            'assets/icons/location.svg',
            fit: BoxFit.fill,
            height: 30,
          ),
        ),
      ),
      body: Stack(
        children: [
          Obx(() {
            if (homeController.isGroupTab.value) {
              // Move to GooglePlex
              homeController.moveToPosition(_pGooglePlex);
            } else {
              // Move to ApplePark
              homeController.moveToPosition(_pApplePark);
            }

            return GoogleMap(
              onMapCreated: homeController.setMapStyle,
              initialCameraPosition:
                  CameraPosition(target: _pGooglePlex, zoom: 13),
              zoomControlsEnabled: false,
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
                ),
              },
            );
          }),
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
      backgroundColor: blackColor,
      foregroundColor: blackColor,
      surfaceTintColor: blackColor,
      centerTitle: false,
      title: Text(
        "TripConnect",
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.26,
          color: whiteColor,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 6),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: whiteColor,
            child: SvgPicture.asset(
              'assets/icons/notification-bell-new.svg',
              height: 28,
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
        color: isActive ? whiteColor : blackColor,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
            letterSpacing: 0.26,
            color: isActive ? blackColor : secondaryTextColor,
          ),
        ),
      ),
    );
  }
}
