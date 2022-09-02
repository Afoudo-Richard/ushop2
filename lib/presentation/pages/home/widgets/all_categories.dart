import 'package:ushop/data/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SectionHeader(
              title: "All Categories",
              trailing: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  LineIcons.times,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: listOfCategory.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100,
                  childAspectRatio: 3 / 2.5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CatgoryItem(
                    category: listOfCategory[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
