import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trip_connect/all_bindings.dart';
import 'package:trip_connect/controllers/navigation_controller.dart';
import 'package:trip_connect/globle/pallet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Connect',
      initialBinding: AllBindings(),
      initialRoute: "/",
      onGenerateRoute: NavigationController.onGenerateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
    );
  }
}
