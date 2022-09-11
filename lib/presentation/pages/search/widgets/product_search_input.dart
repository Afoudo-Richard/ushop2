import 'package:easy_localization/easy_localization.dart';
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
        inputHintText: "search_product_name".tr(),
        trailing: const Icon(LineIcons.search),
        backgroundColor: contentBackgroundColor,
        autofocus: true,
      ),
    );
  }
}
