import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';

class CategorySearchInput extends StatelessWidget {
  const CategorySearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: CustomInput(
        inputHintText: "Search Product Name",
        trailing: const Icon(LineIcons.search),
        backgroundColor: contentBackgroundColor,
      ),
    );
  }
}
