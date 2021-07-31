import 'package:loja_tres_pontos/Controllers/DBController.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonController {
  // ignore: missing_return
  Future<String> loadJson() async {
    return rootBundle.loadString('assets/info.json');
  }

  sendProductsToDB() async {
    var data = json.decode(await loadJson());
    for(int i = 0; i< data['products'].length; i++) {
      print(i);

      double disc = ((double.parse(data['products'][i]['regular_price'].substring(3).replaceAll(',', '.')) - double.parse(data['products'][i]['actual_price'].substring(3).replaceAll(',', '.')))/ double.parse(data['products'][i]['regular_price'].substring(3).replaceAll(',', '.')))*100;

      int onSale = data['products'][i]['on_sale'] == 'true'? 0 : 1;
      DBController.instance.insert({
        'name': data['products'][i]['name'],
        'image': data['products'][i]['image'],
        'regular_price': data['products'][i]['regular_price'],
        'actual_price': data['products'][i]['actual_price'],
        'code_color': data['products'][i]['code_color'],
        'color_slug':data['products'][i]['color_slug'],
        'color':data['products'][i]['color'],
        'on_sale': onSale,
        'discount_percentage': disc,
        'installments': data['products'][i]['installments'],
      });
    }

  }
}