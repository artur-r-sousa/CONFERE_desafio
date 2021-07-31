part of 'product_bloc.dart';

//events in, states out
abstract class ProductEvent extends Equatable {
  ProductEvent();

  @override
  List<Object> get props => [];
}


class GetProductEvent extends ProductEvent{
  String name;
  GetProductEvent({this.name});
}

class DeleteProductEvent extends ProductEvent {
  int id;
  DeleteProductEvent({this.id});
}

class UpdateProductEvent extends ProductEvent {
  Product product;
  UpdateProductEvent({this.product});
}

