// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ushop/data/models/product.dart';

class WishList extends Equatable {
  final List<Product> products;
  const WishList({
    this.products = const [],
  });

  bool productInWishList(Product product) {
    return products.contains(product);
  }

  @override
  List<Object> get props => [products];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory WishList.fromMap(Map<String, dynamic> map) {
    return WishList(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishList.fromJson(String source) =>
      WishList.fromMap(json.decode(source) as Map<String, dynamic>);
}
