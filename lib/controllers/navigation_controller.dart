import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_connect/pages/auth_app/sign_up_page.dart';
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
                // If user is logged in, navigate to HomeScreen
                if (snapshot.data != null) {
                  return HomeScreen();
                }
                // If user is not logged in, navigate to SignupPage
                return SignupPage();
              }
              // Show loading indicator while waiting for auth state
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      case '/home_screen':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/onboarding_screen':
        return MaterialPageRoute(builder: (_) => GetDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SignupPage());
    }
  }
}
