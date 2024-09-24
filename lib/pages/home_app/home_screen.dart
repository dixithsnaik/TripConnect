import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_connect/controllers/signin_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SignInController signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signInController.signOut();
          },
          child: const Text("Home: logout"),
        ),
      ),
    );
  }
}
