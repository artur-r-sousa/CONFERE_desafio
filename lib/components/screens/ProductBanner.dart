import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget{
  ProductBanner({@required this.name, this.imagePath});

  final String name;
  final String imagePath;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height  * 0.3,
      child: Row(
        children: [
          Card(

              child: Image.network(imagePath, fit: BoxFit.fill,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(5),
          ),
          Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                  children: [
                    Text(name, style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, color: Colors.white),),
                  ],
              )
          )
        ],
      ),
    );
  }

}