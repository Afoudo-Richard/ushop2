// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// adds a product to the cart
class CartProductAdded extends CartEvent {
  final Product product;
  CartProductAdded({
    required this.product,
  });
}

/// removes a single instance of that product from the cart
class CartProductRemoved extends CartEvent {
  final Product product;
  CartProductRemoved({
    required this.product,
  });
}

/// removes an entire product from a cart
class EntireCartProductRemoved extends CartEvent {
  final Product product;
  EntireCartProductRemoved({
    required this.product,
  });
}

/// clears or empties the entire cart
class EntireCartCleared extends CartEvent {}
