import 'package:ushop/data/src/models/src/product.dart';

class Seller {
  final String shop_logo_image;
  final String name;
  final bool isApproved;
  final String location;
  final int followers;
  final List<Product> products;
  final String date_joined;
  final String phone;
  Seller({
    required this.shop_logo_image,
    required this.name,
    required this.isApproved,
    required this.location,
    required this.followers,
    required this.products,
    required this.date_joined,
    required this.phone,
  });
}
