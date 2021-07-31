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


  Product(
      {this.id, this.name, this.style, this.codeColor, this.colorSlug,
        this.color, this.onSale, this.regPrice, this.actPrice,
        this.discPercentage, this.installments, this.imgPath});

  factory Product.fromMap(Map<dynamic, dynamic> data) => new Product(
    id: data['_id'],
    name: data['name'],
    style: data['style'],
    codeColor: data['codeColor'],
    colorSlug: data['colorSlug'],
    color: data['color'],
    onSale: data['onSale'],
    discPercentage: data['discount_percentage'],
    installments: int.parse(data['installments'].substring(0,1)),
    imgPath: data['image'],
    regPrice: double.parse(data['regular_price'].substring(3).replaceAll(',', '.')),
    actPrice: double.parse(data['actual_price'].substring(3).replaceAll(',', '.')),
  );

}