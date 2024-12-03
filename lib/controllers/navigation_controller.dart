import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_connect/pages/auth_app/sign_up_page.dart';
import 'package:trip_connect/pages/bottom_bar/app_layout.dart';
import 'package:trip_connect/pages/create_trip_app/create_trip_screen.dart';
import 'package:trip_connect/pages/home_app/home_screen.dart';
import 'package:trip_connect/pages/user_register_app.dart/get_details_screen.dart';

class NavigationController extends GetxController {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                if (snapshot.data != null) {
                  return AppLayout();
                }

                return SignupPage();
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      case '/home_screen':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/onboarding_screen':
        return MaterialPageRoute(builder: (_) => GetDetailsScreen());
      case '/create_trip_select_locations':
        return MaterialPageRoute(builder: (_) =>  CreateTripScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SignupPage());
    }
  }
}
