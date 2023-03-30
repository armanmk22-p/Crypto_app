import 'package:crypto_app/controller.dart';
import 'package:crypto_app/shimmer_eeffect.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'di/di.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final crypto = getIt<HomeController>();
  var  isLoading = false;

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
          future: crypto.getCryptos(),
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


              return LiquidPullToRefresh(
                onRefresh: _refreshAssets,
                backgroundColor: Colors.teal,
                color: Colors.black38,
                // onRefresh: _refreshAssets,
                // displacement: 50,
                // backgroundColor: Colors.black38,
                // color: Colors.white,
                child: isLoading?ShimmerLoader(
                  child: ListView.builder(
                      itemCount:snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final newCrypto = snapshot.data![index];
                        return ListTile(
                          leading: SizedBox(
                              width: 45,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(newCrypto.rank.toString()),
                                ),
                              )),
                          title: Container(color: Colors.white, child: _CustomText(newCrypto.changePercent24Hr,newCrypto.name.toString())),
                          subtitle: Container(color: Colors.white, child: Text(newCrypto.symbol.toString())),
                          trailing: Container(color:Colors.white,child: SizedBox(width: 45, child: Center(child: _CustomIcon(newCrypto.changePercent24Hr)),)),
                        );
                      }),
                ): ListView.builder(
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
                    }),
              );
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

  Future<void> _refreshAssets() async{
    setState(() {
      isLoading=true;
    });
    var delay = await Future.delayed(Duration(milliseconds: 5000));
     await crypto.getCryptos();
     setState(() {
       isLoading=false;
     });
  }
}
