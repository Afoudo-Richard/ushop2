import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ushop/data/models/models.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartProductAdded>(_cartProductAdded);
    on<CartProductRemoved>(_cartProductRemoved);
    on<EntireCartProductRemoved>(_entireCartProductRemoved);
    on<EntireCartCleared>(_entireCartCleared);
  }

  void _cartProductAdded(CartProductAdded event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        cart: Cart(
          products: List.of(state.cart.products)..add(event.product),
        ),
        status: CartStatus.productAdded,
      ),
    );
  }

  void _cartProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    var index = state.cart.products.lastIndexOf(event.product);
    emit(
      state.copyWith(
        cart: Cart(products: List.of(state.cart.products)..removeAt(index)),
        status: CartStatus.productRemoved,
      ),
    );
  }

  void _entireCartProductRemoved(
      EntireCartProductRemoved event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        cart: Cart(
          products: List.of(state.cart.products)
            ..removeWhere(((product) => product == event.product)),
        ),
        status: CartStatus.productRemoved,
      ),
    );
  }

  void _entireCartCleared(EntireCartCleared event, Emitter<CartState> emit) {
    emit(
      state.copyWith(
        cart: Cart(products: List.of(state.cart.products)..clear()),
        status: CartStatus.cleared,
      ),
    );
  }
}
