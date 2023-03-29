import 'package:crypto_app/controller.dart';

import 'package:flutter/material.dart';

import 'di/di.dart';

class MyHome extends StatelessWidget {
  MyHome({Key? key}) : super(key: key);

  final crypro = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Crypto Market'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: crypro.getCryptos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return Center(
                child: Text('Error :' + error.toString()),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final newCrypto = snapshot.data![index];
                    return ListTile(
                      leading: SizedBox(
                          width: 45,
                          child: Center(
                            child: Text(newCrypto.rank.toString()),
                          )),
                      title: Text(newCrypto.name.toString()),
                      subtitle: Text(newCrypto.symbol.toString()),
                    );
                  });
            }
            return Container();
          }),
    ));
  }
}
