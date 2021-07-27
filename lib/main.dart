import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/Db/controller.dart';

void main() => runApp(MaterialApp(home: MyApp(),));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('test'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () async {
              int i = await DBController.instance.insert({
                'name': 'VESTIDO TRANSPASSE BOW',
                'style': "20002605",
                'regular_price': 199.90,
                'actual_price': 199.9
              });

              print('id inserted $i');
            }, child: Text('insert')),
            TextButton(onPressed: () async {
              List<Map<String, dynamic>> queryRows = await DBController.instance.queryAll();
              print(queryRows);

            }, child: Text('query')),
            TextButton(onPressed: () async {
              int updateId = await DBController.instance.update({'_id': 1, 'name': 'nba jersey'});
              print(updateId);
            }, child: Text('update')),
            TextButton(onPressed: () async {
              int deletedRows = await DBController.instance.delete(1);
              print('rows affected : $deletedRows');
            }, child: Text('delete')),
          ],
        ),
      ),
    );
  }
}
