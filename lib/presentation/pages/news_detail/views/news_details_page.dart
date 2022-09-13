import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ushop/data/src/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/news_detail/widgets/other_news.dart';
import 'package:ushop/utils/utils.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        leading: InkWell(
          child: const Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "detail_news".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              LineIcons.share,
              color: Colors.black,
            ),
            onPressed: () => Share.share("This will be the news url.",
                subject: 'Share article'),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                CustomContainer(
                  padding: EdgeInsets.zero,
                  backgroundColor: primaryColor,
                  width: 100.w,
                  height: 30.h,
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
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  news.title,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  news.date_published,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF838589),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  '${news.content} ${news.content}',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                const OtherNewsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
