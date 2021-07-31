import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/Controllers/DBController.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/CustomTextFormField.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  DetailScreen({Key key, @required this.product}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = new TextEditingController(text: product.name);
    final TextEditingController styleController = new TextEditingController(text: product.style);
    final TextEditingController codeColorController = new TextEditingController(text: product.codeColor);
    final TextEditingController colorSlugController = new TextEditingController(text: product.colorSlug);
    final TextEditingController colorController = new TextEditingController(text: product.color);
    final TextEditingController regPriceController = new TextEditingController(text: product.regPrice.toStringAsFixed(2));
    final TextEditingController actPriceController = new TextEditingController(text: product.actPrice.toStringAsFixed(2));
    final TextEditingController instController = new TextEditingController(text: product.installments.toString());
    return Scaffold(
        appBar: AppBar(title: Center(child: Text(product.name))),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  height: 250,
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
            Expanded(
              child: ListView(
                children: [
                  Padding(padding: EdgeInsets.only(left: 12, right: 12, top:8, bottom: 8),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          product: product,
                          controller: nameController,
                          label: 'Name'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: styleController,
                            label: 'Style'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: colorController,
                            label: 'Color'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: colorSlugController,
                            label: 'Color Slug'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: codeColorController,
                            label: 'Code Color'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: instController,
                            label: 'Installments'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: regPriceController,
                            label: 'Regular Price'
                        ),
                        CustomTextFormField(
                          product: product,
                          controller: actPriceController,
                            label: 'Price with Discount'

                        ),
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
                            child: Text('delete')),
                        TextButton(onPressed: (){
                          product.name = nameController.text;
                          product.style = styleController.text;
                          product.codeColor = codeColorController.text;
                          product.colorSlug = colorSlugController.text;
                          product.color = colorController.text;
                          product.installments = int.parse(instController.text);
                          product.regPrice = double.parse(regPriceController.text);
                          product.actPrice = double.parse(actPriceController.text);
                          ProductBloc()..add(UpdateProductEvent(product: product));
                        }, child: Text('update me'))

                      ],
                    ),
                  )
                ]
              ),
            )
          ],
        ));
  }
}
