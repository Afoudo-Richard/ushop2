import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

AppBar appBar({
  String? title,
  bool centerText = true,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    elevation: 0.5,
    backgroundColor: Colors.white,
    title: Text(
      title ?? "Ushop",
      style: TextStyle(
        fontSize: 20.sp,
        color: primaryColor,
      ),
    ),
    centerTitle: centerText,
    actions: actions,
  );
}
