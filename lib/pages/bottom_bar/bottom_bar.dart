import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_connect/controllers/bottom_navbar_controller.dart';
import 'package:trip_connect/globle/pallet.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(
            'assets/icons/bottom_bar/bottombar.svg',
            fit: BoxFit.fill,
            color: blackColor,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomNavItem(
                  index: 0,
                  title: "Home",
                ),
                BottomNavItem(
                  index: 1,
                  title: "Search",
                ),
                const SizedBox(
                  width: 70.0,
                  height: 70.0,
                ),
                BottomNavItem(
                  index: 2,
                  title: "Chat",
                ),
                BottomNavItem(
                  index: 3,
                  title: "Profile",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final int index;
  final String title;
  final bool isGap;

  BottomNavItem({
    super.key,
    required this.index,
    this.title = "",
    this.isGap = false,
  });

  final BottomNavbarController bottomNavbarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomNavbarController.bottamBarActiveIndex.value = index;
      },
      child: Obx(() {
        bool isActive =
            bottomNavbarController.bottamBarActiveIndex.value == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 900),
          curve: Curves.slowMiddle,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                isActive
                    ? bottomNavbarController.activeBottomIcons[index]
                    : bottomNavbarController.inactiveBottomIcons[index],
                fit: BoxFit.fill,
                height: 28,
              ),
              const SizedBox(height: 2),
              isActive
                  ? Text(
                      isGap ? "Gap" : title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: whiteColor,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      }),
    );
  }
}
