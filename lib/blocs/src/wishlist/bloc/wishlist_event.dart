part of 'wishlist_bloc.dart';

abstract class WishListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WishListProductAdded extends WishListEvent {
  final Product product;
  WishListProductAdded({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}

class WishListProductRemoved extends WishListEvent {
  final Product product;
  WishListProductRemoved({
    required this.product,
  });

  @override
  List<Object?> get props => [product];
}

class ClearedWishList extends WishListEvent {}
