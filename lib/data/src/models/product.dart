import 'dart:convert';

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String image;
  final String name;
  final String price;
  final String description;
  final double avg_rating;
  final int total_reviews;
  final int total_available;
  final bool isLiked;

  Product({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.avg_rating,
    required this.total_reviews,
    required this.total_available,
    required this.isLiked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'description': description,
      'avg_rating': avg_rating,
      'total_reviews': total_reviews,
      'total_available': total_available,
      'isLiked': isLiked,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      description: map['description'] as String,
      avg_rating: map['avg_rating'] as double,
      total_reviews: map['total_reviews'] as int,
      total_available: map['total_available'] as int,
      isLiked: map['isLiked'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props {
    return [
      id,
      image,
      name,
      price,
      description,
      avg_rating,
      total_reviews,
      total_available,
      isLiked,
    ];
  }
}
