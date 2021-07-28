import 'package:loja_tres_pontos/Controllers/DBcontroller.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonController {
  // ignore: missing_return
  Future<String> loadJson() async {
    return rootBundle.loadString('assets/info.json');
  }

  sendProductToDB() async {
    var data = json.decode(await loadJson());
    for(int i = 0; i< data['products'].length; i++) {
      DBController.instance.insert({
        'name': data['products'][i]['name'],
        'image': data['products'][i]['image'],
        'regular_price': data['products'][i]['regular_price'],
      });
    }

  }


}