

import 'package:crypto_app/data/network/client_dio.dart';
import 'package:crypto_app/data/network/crypto_api.dart';
import 'package:crypto_app/repository/crypto_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


  void setup() {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton( ClientDio(dio: getIt<Dio>()));
  getIt.registerSingleton( CryptoApi(clientDio: (getIt<ClientDio>())));
  getIt.registerSingleton(CryptoRepository(cryptoApi: getIt<CryptoApi>()));
  

  
}
