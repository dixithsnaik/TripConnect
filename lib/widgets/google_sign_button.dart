import 'dart:ui'; // Needed for the blur effect
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trip_connect/globle/pallet.dart';

class GoogleSignButton extends StatelessWidget {
  final VoidCallback ontap;
  final String icon;
  final String title;

  const GoogleSignButton({
    super.key,
    required this.ontap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 6,
        color:
            Colors.transparent, // Transparent background for the glass effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color.fromARGB(255, 132, 132, 132),
                width: 2), // White border
            color: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(1), // Semi-transparent white
          ),
          child: Stack(
            children: [
              // Blur effect for glassy appearance
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black, // Transparent color
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              // Foreground content
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    icon,
                    height: 26,
                  ),
                  const SizedBox(width: 14),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,

                      color: Colors
                          .black, // Text color is white for better visibility
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
