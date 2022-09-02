import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class LatestSearched extends StatelessWidget {
  const LatestSearched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest Searched",
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(LineIcons.history),
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
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(LineIcons.times),
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
