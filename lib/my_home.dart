import 'package:crypto_app/controller.dart';
import 'package:crypto_app/di/di.dart';
import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
   MyHome({super.key});

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Market'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide(
                  color: Colors.teal,
                  width: 0.8,
                ),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Your Asset',
              ),
            ),
            
          SizedBox(height: 15,),
          Padding(padding: EdgeInsets.all(10),
          child: FutureBuilder(
          future:homeController.getCryptos() ,
          builder:(context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              final error = snapshot.error;
              return Center(child: Text('Error :' + error.toString()),);
            }else if (snapshot.hasData){
              if(snapshot.data!.isEmpty){
                return Center(child: Text('No Data ...'),);
              }
      
              return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                    final crypto = snapshot.data![index];
               return ListTile(
                 leading: SizedBox(width:10 ,child: Center(child: Text(crypto.rank.toString()),)),
                 title:crypto.changePercent24Hr <=0? Text( crypto.name.toString(),style: TextStyle(color: Colors.red),):
                  Text( crypto.name.toString(),style: TextStyle(color: Colors.green),),
                 subtitle: Text(crypto.symbol.toString()),
                 trailing: SizedBox(width: 20, child: Center(child: crypto.changePercent24Hr <=0?
                 Icon(Icons.trending_down, color: Colors.red,):Icon(Icons.trending_up, color: Colors.green,),),),
              
               );
                    },
              separatorBuilder:(context, index) => const Divider(),
               itemCount: snapshot.data!.length,
               );
            }
            return Container();
          }
      
      
      
      ),
          ),
      
      
      
      
      
      
      
      
          ],
        ),
      ),
    );
  }
}