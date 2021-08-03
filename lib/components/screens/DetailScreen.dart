import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/CustomTextFormField.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class DetailScreen extends StatelessWidget {

  Product product;
  DetailScreen({this.product});
  @override
  Widget build(BuildContext context) {

    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String dropValEditable = 'no' ;
    final TextEditingController nameController = new TextEditingController(text: product.name);
    final TextEditingController styleController = new TextEditingController(text: product.style);
    final TextEditingController codeColorController = new TextEditingController(text: product.codeColor);
    final TextEditingController colorSlugController = new TextEditingController(text: product.colorSlug);
    final TextEditingController colorController = new TextEditingController(text: product.color);
    final TextEditingController regPriceController = new TextEditingController(text: product.regPrice.toStringAsFixed(2));
    final TextEditingController actPriceController = new TextEditingController(text: product.actPrice.toStringAsFixed(2));
    final TextEditingController instController = new TextEditingController(text: product.installments.toString());
    final TextEditingController discountController = new TextEditingController(text: product.discPercentage.toString());
    final TextEditingController saleController = new TextEditingController(text: product.onSale.toString() == 'null' ? 'no' : product.onSale.toString());

    return Scaffold(
        appBar: AppBar(title: Center(child: Text(product.name))),
        body: Container(
          color: const Color(0xff8b008b),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          height: 450,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: const Color(0xfffffff),
                                    offset: Offset(1.1, 1.1),
                                    blurRadius: 10.0)
                              ],
                              image: new DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: NetworkImage(product.imgPath))),
                        )),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            product: product,
                            controller: nameController,
                            label: 'Name',
                            color: Colors.white,
                            mandatoryField: true,
                            keyboard: TextInputType.text,
                          ),
                          CustomTextFormField(
                            product: product,
                            controller: styleController,
                            label: 'Style',
                            color: Colors.white,
                            mandatoryField: false,
                            keyboard: TextInputType.text,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: codeColorController,
                            label: 'Color Code',
                            color: Colors.white,
                            mandatoryField: false,
                            keyboard: TextInputType.text,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: colorSlugController,
                            label: 'Color Slug',
                            color: Colors.white,
                            mandatoryField: false,
                            keyboard: TextInputType.text,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: colorController,
                            label: 'Color',
                            color: Colors.white,
                            mandatoryField: false,
                            keyboard: TextInputType.text,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: regPriceController,
                            label: 'Regular Price',
                            color: Colors.white,
                            mandatoryField: true,
                            keyboard: TextInputType.number,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: actPriceController,
                            label: 'Price with Discount',
                            color: Colors.white,
                            mandatoryField: true,
                            keyboard: TextInputType.number,
                          ),
                          CustomTextFormField(
                            product: product,
                            controller: instController,
                            label: 'Installments',
                            color: Colors.white,
                            mandatoryField: false,
                            keyboard: TextInputType.number,

                          ),
                          CustomTextFormField(
                            product: product,
                            controller: discountController,
                            label: 'Discount %',
                            color: Colors.white,
                            mandatoryField: true,
                            keyboard: TextInputType.number,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 12.0, right: 12.0),
                            child: TextFormField(
                              validator:(value) {
                                if(value.isNotEmpty && (value == 'yes' || value == 'no')) {
                                  return null;
                                } else {
                                  return 'Please only enter yes or no';
                                }
                              },
                              decoration: InputDecoration(
                                labelText: 'On Sale',
                                labelStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                              controller: saleController,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                           Center(
                             child: Row(
                               children: [
                                 TextButton(onPressed: (){
                                  if(!_formKey.currentState.validate()) {
                                    return;
                                  }
                                  product.name = nameController.text;
                                  product.style = styleController.text;
                                  product.codeColor = codeColorController.text;
                                  product.colorSlug = colorSlugController.text;
                                  product.color = colorController.text;
                                  product.installments = int.parse(instController.text);
                                  product.regPrice = double.parse(regPriceController.text);
                                  product.actPrice = double.parse(actPriceController.text);
                                  product.imgPath = product.imgPath;
                                  product.onSale = saleController.text == 'yes' ? true : false;
                                  product.discPercentage = double.parse(discountController.text);
                                  ProductBloc()..add(UpdateProductEvent(product: product));
                                  final snackBar = SnackBar(content: const Text('Produto alterado com sucesso'));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) => HomeView(),
                                  ),
                                  );
                                    }, child: Text('Alterar')),
                                 TextButton(onPressed: () {
                                   showDialog(
                                     context: context,
                                     builder: (BuildContext context) {
                                       return AlertDialog(
                                         title: new Text("Confirmação"),
                                         content: new Text(
                                             "Deseja remover o produto: ${nameController.text}"),
                                         actions: <Widget>[
                                           // define os botões na base do dialogo
                                           TextButton(
                                             child: Text("Fechar"),
                                             onPressed: () {
                                               Navigator.of(context).pop();
                                             },
                                           ),
                                           TextButton(
                                             child: Text('Confirmar'),
                                             onPressed: () {
                                               ProductBloc()
                                                 ..add(DeleteProductEvent(id: product.id));
                                               final snackBar = SnackBar(
                                                   content: const Text(
                                                       'Produto removido com sucesso'));
                                               ScaffoldMessenger.of(context)
                                                   .showSnackBar(snackBar);
                                               Navigator.pushReplacement(
                                                 context,
                                                 MaterialPageRoute(
                                                   builder: (context) => HomeView(),
                                                 ),
                                               );
                                             },
                                           )
                                         ],
                                       );
                                     }
                                   );
                                 }, child: (Text('Delete')))
                               ],
                             ),
                           ),

                        ],
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ));
  }
}
