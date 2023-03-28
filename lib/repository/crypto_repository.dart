import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/data/network/crypto_api.dart';
import 'package:crypto_app/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

class CryptoRepository {
  final CryptoApi cryptoApi;

  CryptoRepository({required this.cryptoApi});

  Future<List<CryptoModel>> getAssetsRequested() async {
    try {
      final Response response = await cryptoApi.getCryptoApi();
      final cryptos = (response.data['data'] as List)
          .map((e) => CryptoModel.fromJson(e))
          .toList();
      return cryptos;
    } on DioError catch (e) {
      final messegae = DioExceptions.fromDioError(e).toString();
      throw messegae;
    }
  }
}
