

import 'package:crypto_app/controller.dart';
import 'package:crypto_app/data/network/client_dio.dart';
import 'package:crypto_app/data/network/crypto_api.dart';
import 'package:crypto_app/repository/crypto_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;


Future<void> setup() async{

  getIt.registerSingleton(Dio());
  getIt.registerSingleton( ClientDio( getIt<Dio>()));
  getIt.registerSingleton( CryptoApi(clientDio:getIt<ClientDio>()));
  getIt.registerSingleton(CryptoRepository(cryptoApi: getIt.get<CryptoApi>()));
  getIt.registerSingleton(HomeController());
}
