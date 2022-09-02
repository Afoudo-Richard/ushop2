import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            UserImageWidget(
              radius: 70.sp,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "User name",
              style: TextStyle(
                color: primaryColor,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
