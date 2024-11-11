import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_connect/globle/pallet.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: const Center(
        child: Text(
          "Search",
          style: TextStyle(
            fontSize: 32,
          ),
        ),
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
        // Padding(
        //   padding: const EdgeInsets.only(right: 16, bottom: 6),
        //   child: CircleAvatar(
        //     radius: 18,
        //     backgroundColor: secondaryColor,
        //     child: SvgPicture.asset(
        //       'assets/icons/notification-bell-new.svg',
        //       height: 22,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
