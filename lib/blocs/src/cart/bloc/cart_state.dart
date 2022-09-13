part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  productRemoved,
  productAdded,
  cleared,
}

class CartState extends Equatable {
  final Cart cart;
  final CartStatus status;
  const CartState({
    this.cart = const Cart(),
    this.status = CartStatus.initial,
  });

  @override
  List<Object> get props => [cart, status];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cart': cart.toMap(),
      'status': status.name,
    };
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      cart: Cart.fromMap(map['cart'] as Map<String, dynamic>),
      status: CartStatus.values.byName(map['status'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) =>
      CartState.fromMap(json.decode(source) as Map<String, dynamic>);

  CartState copyWith({
    Cart? cart,
    CartStatus? status,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
    );
  }
}
