import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loja_tres_pontos/bloc/product_bloc.dart';
import 'package:loja_tres_pontos/components/screens/DetailScreen.dart';
import 'package:loja_tres_pontos/components/screens/HomeView.dart';
import 'package:loja_tres_pontos/models/Product.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
          products.sort((a, b) => a.name.toString().toLowerCase().compareTo(b.name.toString().toLowerCase()));
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
                            color: Color(0xff842EB2).withOpacity(0.4),
                            offset: Offset(1.1, 1.1),
                            blurRadius: 10.0
                        )
                      ],
                  ),
                    child: Slidable(
                      actionPane: SlidableScrollActionPane(),
                      actions: [
                        IconSlideAction(
                          icon: Icons.delete,
                          caption: 'Delete',
                          onTap: () => {
                            ProductBloc()..add(DeleteProductEvent(id: products[index].id)),
                            Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => HomeView(),
                            ),)
                          },
                        )
                      ],

                      child: Material(
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                height: height * 0.4,
                                child: CachedNetworkImage(
                                  imageUrl: products[index].imgPath,
                                  imageBuilder: (context, imageProvider) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fitHeight
                                        )
                                      ),
                                    ),
                                  placeholder: (context, url) => Image.asset('assets/defaultProd.png'),
                                  errorWidget: (context, url, error) => Image.asset('assets/defaultProd.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, top: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(products[index].name, style: TextStyle(color: Color(0xff8b008b), fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text('R\$ ${products[index].regPrice.toStringAsFixed(2)}', style: TextStyle(color: Color(0xff8b008b),fontSize: 18, fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10,),
                                  if(products[index].actPrice != null && products[index].actPrice != products[index].regPrice)
                                    Text('PROMOÇÃO!! \n R\$ ${products[index].actPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 15),)

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ),
              );
            }),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 0.9
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