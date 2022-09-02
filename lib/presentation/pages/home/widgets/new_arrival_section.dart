import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: pagePadding,
          child: SectionHeader(
            title: "New Arrivals",
            trailing: InkWell(
              child: Text(
                "See All",
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 37.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listOfProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return ProductItem(
                product:
                    listOfProducts[Random().nextInt(listOfProducts.length)],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 7.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
