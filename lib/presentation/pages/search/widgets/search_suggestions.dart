import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Search Suggestions",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Row(
              children: [
                const Icon(LineIcons.search),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "TMA2 Wireless",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 2.h,
            );
          },
          itemCount: 3,
        ),
      ],
    );
  }
}
