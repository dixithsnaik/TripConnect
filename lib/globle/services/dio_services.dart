import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trip_connect/globle/const/apis.dart';

class DioServices {
  Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 7),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('access_token')}',
        'Content-Type': 'application/json',
      }));

  Dio tokenDio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 7),
      receiveTimeout: const Duration(seconds: 7),
      headers: {
        'Content-Type': 'application/json',
      }));
}
