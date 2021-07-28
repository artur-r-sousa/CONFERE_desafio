import 'package:flutter/material.dart';

class ShowProduct extends StatelessWidget{
  ShowProduct({@required this.name, @required this.fullPrice, @required this.discPrice, @required this.imagePath});

  final String name;
  final double fullPrice;
  final double discPrice;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black38
          )
      ),
      child: Column(
        children: <Widget>[
          Image.network(imagePath),
          Text(name),
          Text('Preço: $fullPrice'),
          Text('Preço c desconto: $discPrice')
        ],
      ),
    );
  }
}