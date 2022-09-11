import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class NoProducts extends StatelessWidget {
  const NoProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          // Image.asset("assets/product_images/emoji1.png"),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "there_are_no_suitable_products".tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "try_using_other_keyworks".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}
