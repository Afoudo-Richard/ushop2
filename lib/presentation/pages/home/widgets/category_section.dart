import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/home/widgets/all_categories.dart';
import 'package:ushop/utils/style.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: pagePadding,
          child: SectionHeader(
            title: "Category",
            trailing: InkWell(
              onTap: () => showModalBottomSheet(
                barrierColor: primaryColor.withOpacity(0.7),
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return const AllCategories();
                },
              ),
              child: Text(
                "See All",
                style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                    color: primaryColor),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 10.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: listOfCategory.length,
            itemBuilder: (BuildContext context, int index) {
              return CatgoryItem(
                category: listOfCategory[index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 7.w,
              );
            },
          ),
        ),
      ],
    );
  }
}
