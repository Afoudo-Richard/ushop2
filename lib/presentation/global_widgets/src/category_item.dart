import 'dart:math';
import 'package:ushop/data/src/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/category_products/views/category_products_page.dart';

import "package:flutter/material.dart";
import 'package:sizer/sizer.dart';

class CatgoryItem extends StatelessWidget {
  CatgoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  Color color = Color(Random().nextInt(1000000) + 1000);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        CategoryProductsPage.route(
          category_name: category.name,
        ),
      ),
      child: Column(
        children: [
          CustomContainer(
            backgroundColor: color.withOpacity(0.2),
            boxShadow: [],
            child: Icon(
              category.icon,
              color: Colors.black,
              size: 18.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            category.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }
}
