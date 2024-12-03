import 'package:flutter_dotenv/flutter_dotenv.dart';

String googleApi =
    "https://places.googleapis.com/v1/places/GyuEmsRBfy61i59si0?fields=addressComponents&key=${dotenv.env['MAPS_API_KEY']}";

String baseUrl = "";
String authGoogle = '$baseUrl/Link/auth/google/';
String authApple = '$baseUrl/Link/auth/apple/';
