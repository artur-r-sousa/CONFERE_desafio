import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/Controllers/DBController.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(product.name))),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0)
                      ],
                      image: new DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: NetworkImage(product.imgPath))),
                )),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: Text('click me')),
                  TextButton(
                      onPressed: () {
                        ProductBloc()..add(DeleteProductEvent(id: product.id));
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),);
                      },
                      child: Text('delete'))
                ],
              ),
            )
          ],
        ));
  }
}
