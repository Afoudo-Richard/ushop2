import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/news/views/news_page_layout.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NewsPage(),
      settings: RouteSettings(name: "NewsPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const NewsPageLayout();
  }
}
