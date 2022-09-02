import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class ProductSearchInput extends StatelessWidget {
  const ProductSearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: CustomInput(
        inputHintText: "Search Product Name",
        trailing: const Icon(LineIcons.search),
        backgroundColor: contentBackgroundColor,
        autofocus: true,
      ),
    );
  }
}
