import 'package:crypto_app/controller.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final crypro = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Crypto Market'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  itemCount:snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final newCrypto = snapshot.data![index];
                    return ListTile(
                      leading: SizedBox(
                          width: 45,
                          child: Center(
                            child: Text(newCrypto.rank.toString()),
                          )),
                      title: _CustomText(newCrypto.changePercent24Hr,newCrypto.name.toString()),
                      subtitle: Text(newCrypto.symbol.toString()),
                      trailing: SizedBox(width: 45, child: Center(child: _CustomIcon(newCrypto.changePercent24Hr)),),
                    );
                  });
            }
            return Container();
          }),
    ));
  }

  Widget _CustomIcon(double change){
    return change<=0 ? Icon(Icons.trending_down,color: Colors.red) : Icon(Icons.trending_up,color: Colors.green,);
  }
  Widget _CustomText(double change,String title){
    return change<=0 ? Text(title,style: TextStyle(color: Colors.red),): Text(title,style: TextStyle(color: Colors.green),);
  }
}
