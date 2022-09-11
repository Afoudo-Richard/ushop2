import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class HorizontalProductsListing extends StatelessWidget {
  const HorizontalProductsListing({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding,
    required this.separatorBuilder,
  });

  final int itemCount;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) separatorBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: ListView.separated(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        separatorBuilder: separatorBuilder,
      ),
    );
  }
}
