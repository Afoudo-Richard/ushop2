import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/search/views/search_page_layout.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return const SearchPageLayout();
  }
}
