import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:ushop/data/models/models.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(const WishListState()) {
    on<WishListProductAdded>(_wishListProductAdded);
    on<WishListProductRemoved>(_wishListProductRemoved);
    on<ClearedWishList>(_clearedWishList);
  }

  void _wishListProductAdded(
      WishListProductAdded event, Emitter<WishListState> emit) {
    state.wishList.productInWishList(event.product)
        ? emit(
            state.copyWith(
              productStatus: WishListStatus.productExist,
            ),
          )
        : emit(
            state.copyWith(
              wishList: WishList(
                products: List.of(state.wishList.products)..add(event.product),
              ),
              productStatus: WishListStatus.productAdded,
            ),
          );
  }

  void _wishListProductRemoved(
      WishListProductRemoved event, Emitter<WishListState> emit) {
    emit(
      state.copyWith(
        wishList: WishList(
          products: List.of(state.wishList.products)..remove(event.product),
        ),
        productStatus: WishListStatus.productRemoved,
      ),
    );
  }

  void _clearedWishList(ClearedWishList event, Emitter<WishListState> emit) {
    emit(
      state.copyWith(
        wishList: WishList(
          products: List.of(state.wishList.products)..clear(),
        ),
        productStatus: WishListStatus.cleared,
      ),
    );
  }
}
