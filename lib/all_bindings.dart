import 'package:get/get.dart';
import 'package:trip_connect/controllers/bottom_navbar_controller.dart';
import 'package:trip_connect/controllers/home_controller.dart';
import 'package:trip_connect/controllers/navigation_controller.dart';
import 'package:trip_connect/controllers/signin_controller.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<BottomNavbarController>(() => BottomNavbarController());
  }
}
