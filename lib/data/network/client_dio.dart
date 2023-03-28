
import 'package:crypto_app/constants.dart';
import 'package:dio/dio.dart';

class ClientDio {
  final Dio dio;

  ClientDio(this.dio) {
    dio
      ..options.baseUrl = AppConstants.BaseUrl
      ..options.connectTimeout =Duration(seconds: AppConstants.Connection_TimeOut)
      ..options.receiveTimeout = Duration(seconds: AppConstants.Recieve_TimeOut)
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
          await dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
