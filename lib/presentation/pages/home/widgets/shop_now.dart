import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class ShopNow extends StatelessWidget {
  const ShopNow({
    Key? key,
    required this.title,
    required this.imagefile,
    this.onTap,
    required this.bgColor,
  }) : super(key: key);

  final String title;
  final String imagefile;
  final void Function()? onTap;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        backgroundColor: bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Shop now",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(
                        LineIcons.arrowRight,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(imagefile),
          ],
        ),
      ),
    );
  }
}
