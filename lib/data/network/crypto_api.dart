

import 'package:crypto_app/constants.dart';
import 'package:crypto_app/data/network/client_dio.dart';
import 'package:dio/dio.dart';

class CryptoApi {

  final ClientDio clientDio;

  CryptoApi({required this.clientDio});

  Future <Response> getCryptoApi() async{

    try {
      final Response response = await clientDio.get(url:AppConstants.EndPoint_Assets )
      return response;
    } catch (e) {
      rethrow;
    }
  }
}