import 'package:crypto_app/constants.dart';
import 'package:dio/dio.dart';

class ClientDio {
  final Dio dio;

  ClientDio({required this.dio}) {
    dio
      ..options.baseUrl = AppConstants.BaseUrl
      ..options.connectTimeout = AppConstants.Connection_TimeOut as Duration?
      ..options.receiveTimeout = AppConstants.Recieve_TimeOut as Duration?
      ..options.responseType = ResponseType.json
      ..interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  }

  //----------------------- Get -------------------------

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response =
          await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
