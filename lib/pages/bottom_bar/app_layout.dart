import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_connect/controllers/bottom_navbar_controller.dart';
import 'package:trip_connect/globle/pallet.dart';
import 'package:trip_connect/pages/bottom_bar/bottom_bar.dart';
import 'package:trip_connect/pages/home_app/home_screen.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  final BottomNavbarController bottomNavbarController = Get.find();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: Obx(
        () => Container(
          margin: const EdgeInsets.only(bottom: 30),
          width: 70.0,
          height: 70.0,
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
            onPressed: () {
              bottomNavbarController.bottamBarActiveIndex.value = 4;
            },
            backgroundColor:
                bottomNavbarController.bottamBarActiveIndex.value == 4
                    ? whiteColor
                    : blackColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(
              Icons.add,
              color: bottomNavbarController.bottamBarActiveIndex.value == 4
                  ? blackColor
                  : whiteColor,
              size: 35,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          Obx(
            () => bottomNavbarController
                .tabs[bottomNavbarController.bottamBarActiveIndex.value],
          ),
          Positioned(
            bottom: 0,
            child: BottomBar(size: size),
          ),
        ],
      ),
    );
  }
}
