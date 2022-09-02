import 'package:flutter/material.dart';
import 'package:ushop/data/models/news.dart';
import 'package:ushop/presentation/pages/news_detail/views/news_details_page_layout.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  static Route route(News news) {
    return MaterialPageRoute<void>(
        builder: (_) => NewsDetailPage(
              news: news,
            ));
  }

  final News news;

  @override
  Widget build(BuildContext context) {
    return NewsDetailPageLayout(
      news: news,
    );
  }
}
