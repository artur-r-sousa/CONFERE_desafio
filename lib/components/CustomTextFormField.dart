import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class CustomTextFormField extends StatelessWidget {
  final Product product;
  final TextEditingController controller;
  final String label;

  CustomTextFormField({this.product, this.controller, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 12.0, right: 12.0),
      child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
        ),
        controller: controller,
      ),
    );
  }

}