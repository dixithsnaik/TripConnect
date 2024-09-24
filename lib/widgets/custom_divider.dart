import 'package:flutter/material.dart';
import 'package:trip_connect/globle/pallet.dart';



class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0X0F9DB2CE), primaryTextColor],
            ),
          ),
        ),
        const Text(
          "Or",
          style: TextStyle(
            color: primaryTextColor,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          height: 2,
          width: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                primaryTextColor,
                Color(0X0F9DB2CE),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
