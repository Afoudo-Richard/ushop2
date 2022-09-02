import "package:flutter/material.dart";
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.trailing = const SizedBox.shrink(),
    this.titleTextStyle,
  }) : super(key: key);

  final String title;
  final Widget trailing;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ).merge(titleTextStyle),
        ),
        trailing,
      ],
    );
  }
}
