import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class CustomTextFormField extends StatelessWidget {
  final Product product;
  final TextEditingController controller;
  final String label;
  final Color color;
  final TextInputType keyboard;
  final bool mandatoryField;

  CustomTextFormField({this.product, this.controller, this.label, this.color, this.keyboard, this.mandatoryField});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 12.0, right: 12.0),
      child: TextFormField(
          validator: mandatoryField ? (value) {
            if(value.isNotEmpty && value != '') {
              return null;
            } else {
              return 'Campo Obrigatorio';
            }
          } : null,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: color),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
        ),
        controller: controller,
        keyboardType: keyboard,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

}