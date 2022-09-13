import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/src/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/news/views/news_page.dart';
import 'package:ushop/utils/style.dart';

class LatestNewsSection extends StatelessWidget {
  const LatestNewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: pagePadding,
          child: SectionHeader(
            title: "latest_news".tr(),
          ),
        ),
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
                news: news_list[Random().nextInt(3)],
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                height: 5.h,
              );
            },
            itemCount: 3,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Padding(
          padding: pagePadding,
          child: SizedBox(
            width: double.infinity,
            child: CustomButton(
              onPressed: () => Navigator.push(context, NewsPage.route()),
              backgroundColor: Colors.white,
              border: const BorderSide(),
              child: Text(
                "see_all_news".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
