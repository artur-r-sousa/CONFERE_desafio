import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/screens/DetailScreen.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>
      (listener: (BuildContext context, ProductState state) {
      if (state is ProductLoading) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircularProgressIndicator(),
          ],
        );
      } else if (state is ProductError) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('${state.message}'),
            )
          ],
        );
      }
    }, builder: (context, state) {
      if (state is ProductLoaded) {
        if (state.products == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularProgressIndicator(),
            ],
          );
        } else {
          List<Product> products = state.products;
          return GridView(
            padding: EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 16),
            physics: const ScrollPhysics(),
            scrollDirection: Axis.vertical,
            children:
            List.generate(products.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(product: products[index]),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0
                        )
                      ],
                  ),
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 250,
                              decoration: BoxDecoration(
                                image: new DecorationImage(

                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(products[index].imgPath)),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, top: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(products[index].name, style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),),
                                SizedBox(height: 10,),
                                Text('R\$ ${products[index].regPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold)),
                                SizedBox(height: 10,),
                                if(products[index].actPrice != null && products[index].actPrice != products[index].regPrice)
                                  Text('PROMOÇÃO!! R\$ ${products[index].actPrice.toStringAsFixed(2)}', style: TextStyle( fontWeight: FontWeight.bold),)

                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 0.45
            ),
          );
        }
      } else {
        return Column(
          children: [CircularProgressIndicator()],
        );
      }
    }
    );
  }
}