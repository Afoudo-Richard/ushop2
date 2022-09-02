import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/category_products/views/category_products_page_layout.dart';
import 'package:ushop/presentation/pages/search/views/search_page_layout.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({Key? key, required this.category_name})
      : super(key: key);

  final String category_name;

  static Route route({required String category_name}) {
    return MaterialPageRoute<void>(
        builder: (_) => CategoryProductsPage(
              category_name: category_name,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return CategoryProductsPageLayout(category_name: category_name);
  }
}
