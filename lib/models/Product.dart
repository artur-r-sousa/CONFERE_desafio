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
        this.discPercentage, this.installments, this.imgPath}
        );

  factory Product.fromMap(Map<dynamic, dynamic> data) => new Product(
    id: data['_id'],
    name: data['name'],
    style: data['style'],
    codeColor: data['codeColor'],
    colorSlug: data['colorSlug'],
    color: data['color'],
    onSale: data['onSale'],
    discPercentage: data['discount_percentage'],
    installments: data['installments'],
    imgPath: data['image'],
    regPrice: data['regular_price'],
    actPrice: data['actual_price']
  );

}