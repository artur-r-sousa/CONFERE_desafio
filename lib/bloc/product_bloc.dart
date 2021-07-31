import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loja_tres_pontos/Controllers/DBController.dart';
import 'package:loja_tres_pontos/models/Product.dart';

part 'product_event.dart';
part 'product_state.dart';

//events in, states out
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProductEvent) {
      try {
        yield ProductLoading();
        await Future.delayed(const Duration(seconds: 2));
        final data = await DBController.instance.queryAll();
        yield ProductLoaded(products: data);
      } catch (e) {
        print(e);
      }
    } else if (event is DeleteProductEvent) {
      try {
        int prodId = await DBController.instance.delete(event.id);
        yield ProductDeleted(prodId: prodId);
        await Future.delayed(const Duration(seconds: 2));
        yield ProductLoaded();
      } catch (e) {
        print(e);
      }
    } else if (event is UpdateProductEvent){
      try{
        print("here");
        Map<String, dynamic> row = {
          '_id': event.product.id,
          'name': event.product.name,
          'style': event.product.style,
          'code_color': event.product.codeColor,
          'color_slug': event.product.colorSlug,
          'color': event.product.color,
          'on_sale': event.product.onSale,
          'regular_price': event.product.regPrice,
          'actual_price': event.product.actPrice,
          'discount_percentage': event.product.discPercentage,
          'installments': event.product.installments,
          'image': event.product.imgPath
        };
        int update = await DBController.instance.update(row);
        yield ProductUpdated(update: update);
        await Future.delayed(const Duration(seconds: 2));
        yield ProductLoaded();
      } catch (e) {
        print(e);
      }
    }
  }
}
