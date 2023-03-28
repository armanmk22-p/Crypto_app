import 'package:crypto_app/my_home.dart';
import 'package:flutter/material.dart';



void main()=>runApp(const MyApp());





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'CryptoApplication',
      darkTheme:  ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHome(),
    );
  }
}