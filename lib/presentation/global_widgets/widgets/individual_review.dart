import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ushop/data/models/review.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';
import 'package:sizer/sizer.dart';

class IndividualReview extends StatelessWidget {
  const IndividualReview({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCircle(
            radius: 40.sp,
            color: primaryColor,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: secondaryColor,
                ),
              ),
              imageUrl: review.user.photo ??
                  "https://ui-avatars.com/api/?name=U+Shop",
            ),
          ),
          SizedBox(
            width: deviceWidth(context) * 0.03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.user.name ?? "N/A",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Text(
                      review.date_posted,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.01,
                ),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: review.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15.sp,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(
                  height: deviceHeight(context) * 0.01,
                ),
                Text(
                  review.review,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.sp,
                    letterSpacing: 1.5,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
