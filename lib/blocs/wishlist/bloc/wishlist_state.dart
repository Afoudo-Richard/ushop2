// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'wishlist_bloc.dart';

enum WishListStatus {
  initial,
  productExist,
  productRemoved,
  productAdded,
  cleared
}

class WishListState extends Equatable {
  final WishList wishList;
  final WishListStatus productStatus;

  const WishListState({
    this.wishList = const WishList(),
    this.productStatus = WishListStatus.initial,
  });

  @override
  List<Object> get props => [wishList, productStatus];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wishList': wishList.toMap(),
      'productStatus': productStatus.name,
    };
  }

  factory WishListState.fromMap(Map<String, dynamic> map) {
    return WishListState(
      wishList: WishList.fromMap(map['wishList'] as Map<String, dynamic>),
      productStatus:
          WishListStatus.values.byName(map['productStatus'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishListState.fromJson(String source) =>
      WishListState.fromMap(json.decode(source) as Map<String, dynamic>);

  WishListState copyWith({
    WishList? wishList,
    WishListStatus? productStatus,
  }) {
    return WishListState(
      wishList: wishList ?? this.wishList,
      productStatus: productStatus ?? this.productStatus,
    );
  }
}
