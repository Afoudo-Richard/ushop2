import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/models/news.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/news_detail/views/news_details_page.dart';
import 'package:ushop/utils/style.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.news,
  }) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, NewsDetailPage.route(news)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  news.content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  news.date_published,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
          CustomContainer(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.green,
            width: 20.w,
            height: 12.h,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: secondaryColor,
                ),
              ),
              imageUrl: news.imageThumbnail,
            ),
          ),
        ],
      ),
    );
  }
}
