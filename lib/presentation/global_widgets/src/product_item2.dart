import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/product_detail/views/product_detail_page.dart';
import 'package:ushop/utils/utils.dart';

class ProductItem2 extends StatelessWidget {
  const ProductItem2({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, ProductDetailPage.route(product));
      },
      child: CustomContainer(
        padding: EdgeInsets.zero,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
        child: Column(
          children: [
            SizedBox(
              width: 100.w,
              height: 17.5.h,
              child: Row(
                children: [
                  Container(
                    width: 33.w,
                    height: 100.h,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: primaryColor,
                              color: secondaryColor,
                            ),
                          ),
                          imageUrl: product.image,
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: GestureDetector(
                            child: CustomContainer(
                              borderRadius: BorderRadius.circular(5.sp),
                              backgroundColor: Colors.black.withOpacity(0.3),
                              padding: EdgeInsets.all(2.sp),
                              child: Row(
                                children: [
                                  Text(
                                    "5",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                    size: 10.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(4.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Color(0XFFFFC120),
                                size: 15.sp,
                              ),
                              Text(
                                product.location,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          CustomContainer(
                            backgroundColor: Colors.grey.shade200,
                            boxShadow: [],
                            padding: EdgeInsets.all(4.sp),
                            child: Text(
                              product.itemState,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            r"$45000",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    padding: EdgeInsets.all(5.sp),
                    child: Text(
                      "Chat".tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.w,
                ),
                const Expanded(
                  child: CallButton(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
