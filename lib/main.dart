import 'package:flutter/material.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tres Pontos',
      home: HomeView()
    );
  }
}


