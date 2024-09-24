import 'package:flutter/material.dart';

import 'package:trip_connect/globle/pallet.dart';

class CustomTextFiled extends StatelessWidget {
  final String lable;
  TextEditingController textEditingController;
  CustomTextFiled({
    super.key,
    required this.lable,
    required this.textEditingController,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: blueColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lable,
            style: const TextStyle(
              color: primaryTextColor,
              fontSize: 12,
            ),
          ),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide.none, // Customize the border color
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide
                      .none // Customize the border color and width when focused
                  ),
              border: UnderlineInputBorder(),
              enabled: true,
              focusColor: blueColor,
            ),
          ),
        ],
      ),
    );
  }
}
