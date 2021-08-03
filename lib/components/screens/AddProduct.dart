import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/CustomTextFormField.dart';
import 'package:loja_tres_pontos/models/Product.dart';

import 'HomeView.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);

  @override
  State<AddProduct> createState() => AddProductState();
}

class AddProductState extends State<AddProduct> {
  static bool switchTileValue = false;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Product product = new Product(name: '');


    final TextEditingController nameController = new TextEditingController();
    final TextEditingController styleController = new TextEditingController();
    final TextEditingController codeColorController =
        new TextEditingController();
    final TextEditingController colorSlugController =
        new TextEditingController();
    final TextEditingController colorController = new TextEditingController();
    final TextEditingController regPriceController =
        new TextEditingController();
    final TextEditingController actPriceController =
        new TextEditingController();
    final TextEditingController instController = new TextEditingController();
    final TextEditingController discController = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('New Product'),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomTextFormField(
                    product: product,
                    controller: nameController,
                    label: 'Name',
                    color: Color(0xff8b008b),
                    mandatoryField: true,
                    keyboard: TextInputType.text,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: styleController,
                    label: 'Style',
                    color: Color(0xff8b008b),
                    mandatoryField: false,
                    keyboard: TextInputType.text,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: codeColorController,
                    label: 'Color Code',
                    color: Color(0xff8b008b),
                    mandatoryField: false,
                    keyboard: TextInputType.text,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: colorSlugController,
                    label: 'Color Slug',
                    color: Color(0xff8b008b),
                    mandatoryField: false,
                    keyboard: TextInputType.text,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: colorController,
                    label: 'Color',
                    color: Color(0xff8b008b),
                    mandatoryField: false,
                    keyboard: TextInputType.text,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: regPriceController,
                    label: 'Regular Price',
                    color: Color(0xff8b008b),
                    mandatoryField: true,
                    keyboard: TextInputType.number,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: actPriceController,
                    label: 'Price with Discount',
                    color: Color(0xff8b008b),
                    mandatoryField: true,
                    keyboard: TextInputType.number,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: instController,
                    label: 'Installments',
                    color: Color(0xff8b008b),
                    mandatoryField: false,
                    keyboard: TextInputType.number,
                  ),
                  CustomTextFormField(
                    product: product,
                    controller: discController,
                    label: 'Discount %',
                    color: Color(0xff8b008b),
                    mandatoryField: true,
                    keyboard: TextInputType.number,
                  ),
                  SwitchListTile(
                    title: const Text('On Sale'),
                    value: switchTileValue,
                    onChanged: (bool value) {
                      setState(() {
                        switchTileValue = value;
                      });
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Confirmação"),
                              content: new Text(
                                  "Deseja adicionar o produto: ${nameController.text}"),
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
                                    product.name = nameController.text;
                                    product.style = styleController.text;
                                    product.codeColor =
                                        codeColorController.text;
                                    product.colorSlug =
                                        colorSlugController.text;
                                    product.color = colorController.text;
                                    product.installments =
                                        int.parse(instController.text).round();
                                    product.regPrice =
                                        double.parse(regPriceController.text);
                                    product.actPrice =
                                        double.parse(actPriceController.text);
                                    product.onSale =
                                        switchTileValue;
                                    product.imgPath = 'assets';
                                    product.discPercentage =
                                        ((product.regPrice - product.actPrice) /
                                                product.regPrice) *
                                            100;
                                    ProductBloc()
                                      ..add(AddProductEvent(product: product));
                                    final snackBar = SnackBar(
                                        content: const Text(
                                            'Produto Adicionado com sucesso'));
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
                          },
                        );
                      },
                      child: Text('Criar'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
