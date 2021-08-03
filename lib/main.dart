import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/Controllers/DBController.dart';
import 'package:loja_tres_pontos/components/screens/AddProduct.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBController.instance.database;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xff8b008b),
          fontFamily:'BreeSerif',
        ),
      debugShowCheckedModeBanner: false,
      title: 'Tres Pontos',
      home: HomeView()
    );
  }
}


