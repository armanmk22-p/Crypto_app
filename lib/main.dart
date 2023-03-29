import 'package:crypto_app/di/di.dart';
import 'package:crypto_app/my_home.dart';
import 'package:flutter/material.dart';



void main(){
setup();
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoApplication',
      darkTheme:  ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHome(),
    );
  }
}