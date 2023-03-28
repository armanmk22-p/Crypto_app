

import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/di/di.dart';
import 'package:crypto_app/repository/crypto_repository.dart';

class HomeController {


  final cryptoRepository = getIt.get<CryptoRepository>();


    Future<List<CryptoModel>> getCryptos() async {
    final cryptos = await cryptoRepository.getAssetsRequested();
    return cryptos;
  }

}