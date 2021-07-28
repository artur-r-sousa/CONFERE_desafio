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

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'] as String,
        imgPath: json['image'] as String,
        regPrice: json['regular_price'] as double
    );
  }

}