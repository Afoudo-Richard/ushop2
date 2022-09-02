import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class NoProducts extends StatelessWidget {
  const NoProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image.asset("assets/product_images/emoji1.png"),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "There are no suitable products",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          "Please try using other keywords to find the product name",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
