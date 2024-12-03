import 'package:get/get.dart';
import 'package:trip_connect/pages/chat_app/chat_screen.dart';
import 'package:trip_connect/pages/create_trip_app/create_trip_screen.dart';
import 'package:trip_connect/pages/home_app/home_screen.dart';
import 'package:trip_connect/pages/profile_app/profile_screen.dart';
import 'package:trip_connect/pages/search_app/search_screen.dart';

class BottomNavbarController extends GetxController {
  final tabs = [
    HomeScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
    
  ];

  RxInt bottamBarActiveIndex = 0.obs;

  List activeBottomIcons = [
    'assets/icons/bottom_bar/selected/home.svg',
    'assets/icons/bottom_bar/selected/search.svg',
    'assets/icons/bottom_bar/selected/chat.svg',
    'assets/icons/bottom_bar/selected/user.svg'
  ];
  List inactiveBottomIcons = [
    'assets/icons/bottom_bar/unselected/home.svg',
    'assets/icons/bottom_bar/unselected/search.svg',
    'assets/icons/bottom_bar/unselected/chat.svg',
    'assets/icons/bottom_bar/unselected/user.svg'
  ];
}
