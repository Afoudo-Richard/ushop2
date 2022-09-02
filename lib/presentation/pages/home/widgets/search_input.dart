import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/search/views/search_page.dart';
import 'package:ushop/utils/utils.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pagePadding,
      child: GestureDetector(
        onTap: () => Navigator.push(context, SearchPage.route()),
        child: CustomInput(
          inputHintText: "Search Product Name",
          trailing: const Icon(LineIcons.search),
          backgroundColor: contentBackgroundColor,
          inputEnabled: false,
        ),
      ),
    );
  }
}
