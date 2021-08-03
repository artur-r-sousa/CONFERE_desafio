import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/ProductComponent.dart';
import 'package:loja_tres_pontos/components/screens/AddProduct.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Row(
        children: <Widget>[
          Spacer(),
          Text('Loja Tres Pontos'),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 25, top: 10),
            child: Column(
              children: [
                IconButton(icon: const Icon(Icons.add), onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddProduct()))
                }),
                Text('ADD PRODUCT', style: TextStyle(fontSize: 10),),
              ],
            ),
          )
        ],
      ),),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xff8b008b),
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