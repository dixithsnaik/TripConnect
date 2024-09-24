import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trip_connect/controllers/signin_controller.dart';
import 'package:trip_connect/globle/pallet.dart';
import 'package:trip_connect/widgets/google_sign_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final SignInController signInController = Get.find();

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background image with blur
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 5.0, sigmaY: 1.0), // Adjust blur intensity
              child: Container(
                color: Colors.black
                    .withOpacity(0.4), // Transparent color to apply the blur
              ),
            ),
          ),
          // Foreground content (your SingleChildScrollView)
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center widgets vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center widgets horizontally
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/logo/app_logo.svg',
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "TripConnect",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: whiteColor,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Column(
                    children: [
                      const Text(
                        "Welcome,",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: greenColor,
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, -8),
                        child: const Text(
                          "Glad to see you!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: yellowColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        GoogleSignButton(
                          title: "Login with google",
                          ontap: signInController.signInWithGoogle,
                          icon: "assets/logo/google-l.png",
                        ),
                        const SizedBox(height: 16),
                        GoogleSignButton(
                          title: "Login with Apple",
                          ontap: signInController.signInWithApple,
                          icon: "assets/logo/apple.png",
                        ),
                      ],
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
}
