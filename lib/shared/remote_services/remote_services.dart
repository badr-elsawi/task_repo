import 'package:dio/dio.dart';

class DioService {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}