// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:ushop/data/models/product.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({
    this.products = const [],
  });

  Map productQuantity(List<Product> products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  bool productInCart(Product product) {
    return products.contains(product);
  }

  double get total =>
      products.fold(0, (total, current) => total + double.parse(current.price));

  @override
  List<Object> get props => [products];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      products: List<Product>.from(
        (map['products'] as List<int>).map<Product>(
          (x) => Product.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);
}
