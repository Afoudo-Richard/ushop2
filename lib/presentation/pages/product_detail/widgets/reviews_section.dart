import 'package:easy_localization/easy_localization.dart';
import "package:flutter/material.dart";
import 'package:ushop/data/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/product_detail/widgets/all_reviews.dart';
import 'package:ushop/utils/utils.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "reviews".tr() + " (86)",
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color(0XFFFFC120),
                  size: 14.sp,
                ),
                SizedBox(
                  width: 1.w,
                ),
                Text(
                  "4.6",
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return IndividualReview(
              review: listOfReviews[index],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 10,
            );
          },
          itemCount: 3,
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: () => showModalBottomSheet(
              barrierColor: primaryColor.withOpacity(0.7),
              isScrollControlled: true,
              context: context,
              builder: (ctx) {
                return const AllReviews();
              },
            ),
            backgroundColor: Colors.white,
            border: const BorderSide(),
            child: Text(
              "see_all_reviews".tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
