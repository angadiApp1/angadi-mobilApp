import 'package:angadiapp/core/constants/app_details.dart';
import 'package:dio/dio.dart';

class DioFactory {
  final String baseUrl = AppDetails.baseUrl;

  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // Add any default headers
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      requestBody: true,
      responseHeader: true,
      requestHeader: true,
    ));

    return dio;
  }
}