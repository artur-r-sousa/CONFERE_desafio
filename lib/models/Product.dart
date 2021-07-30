import 'package:flutter/cupertino.dart';

class Product{
  int id;
  String name;
  String style;
  String codeColor;
  String colorSlug;
  String color;
  bool onSale;
  double regPrice;
  double actPrice;
  double discPercentage;
  int installments;
  String imgPath;

  Product({this.name, this.imgPath, this.regPrice});

  factory Product.fromMap(Map<dynamic, dynamic> data) => new Product(
    name: data['name'],
    imgPath: data['image'],
    regPrice: double.parse(data['regular_price'].substring(3).replaceAll(',', '.'))

  );

}