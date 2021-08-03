part of 'product_bloc.dart';

//events in, states out
abstract class ProductState extends Equatable {
  ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {
  ProductInitial();
}

class ProductLoading extends ProductState {
  ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded({this.products});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) {
      return true;
    }

    return o is ProductLoaded && o.products == products;
  }

  @override
  int get hashCode => products.hashCode;
}

class ProductAdded extends ProductState {
  final int product;
  ProductAdded({this.product});
}

class ProductDeleted extends ProductState {
  final int prodId;
  ProductDeleted({this.prodId});
}

class ProductUpdated extends ProductState {
  final int update;
  ProductUpdated({this.update});
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ProductError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
