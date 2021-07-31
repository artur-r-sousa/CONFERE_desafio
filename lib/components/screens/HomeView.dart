import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/ProductComponent.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Loja Tres Pontos')),),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Flexible(
                    child: BlocProvider<ProductBloc>(
                      create: (context) => ProductBloc()..add(GetProductEvent(name: 'Product')),
                      child: ProductComponent(),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}