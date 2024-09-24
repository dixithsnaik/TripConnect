import 'package:flutter/material.dart';
import 'package:trip_connect/globle/pallet.dart';


class CustomLoginButton extends StatelessWidget {
  final String lable;
  final VoidCallback ontap;
  final bool isPrimaryButton;
  const CustomLoginButton({
    super.key,
    required this.lable,
    required this.ontap,
    this.isPrimaryButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        elevation: 6,
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          decoration: isPrimaryButton
              ? BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10),
                )
              : BoxDecoration(
                  color: whiteColor,
                  border: Border.all(color: blueColor, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
          child: Text(
            lable,
            style: isPrimaryButton
                ? const TextStyle(
                    fontSize: 18,
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  )
                : const TextStyle(
                    fontSize: 18,
                    color: blueColor,
                    fontWeight: FontWeight.w500,
                  ),
          ),
        ),
      ),
    );
  }
}
