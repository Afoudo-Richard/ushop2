import 'package:ushop/data/src/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/news/views/widgets/news_search.dart';
import 'package:ushop/presentation/pages/news_detail/views/news_details_page.dart';
import 'package:ushop/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class NewsPageLayout extends StatelessWidget {
  const NewsPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        leading: InkWell(
          child: Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "News",
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              const NewsSearch(),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: pagePadding,
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NewsItem(
                      news: news_list[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 5.h,
                    );
                  },
                  itemCount: news_list.length,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
