import 'dart:math';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/data/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/seller_info/widgets/seller_products.dart';
import 'package:ushop/utils/style.dart';

class SellerInfoPage extends StatelessWidget {
  const SellerInfoPage({
    Key? key,
    required this.seller,
  }) : super(key: key);

  static Route route(Seller seller) {
    return MaterialPageRoute<void>(
      builder: (_) => SellerInfoPage(
        seller: seller,
      ),
    );
  }

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        leading: InkWell(
          child: const Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Info Seller",
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              LineIcons.search,
              color: Colors.black,
              size: 20.sp,
            ),
            onPressed: () => Share.share(
              "This will be the news url.",
              subject: 'Share article',
            ),
          ),
          const CartButton(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: pagePadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    SellerName(
                      shop_logo_image: seller.shop_logo_image,
                      name: seller.name,
                      isApproved: seller.isApproved,
                      trailing: Icon(
                        LineIcons.angleRight,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Icon(LineIcons.mapMarker),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Text(
                            seller.location,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SellerInfoItem(
                          title: "Followers",
                          value: seller.followers.toString(),
                        ),
                        SellerInfoItem(
                          title: "Products",
                          value: seller.products.length.toString(),
                        ),
                        SellerInfoItem(
                          title: "Joined",
                          value: seller.date_joined,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Shipping Support",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(
                        LineIcons.angleRight,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                  ],
                ),
              ),
              CustomContainer(
                width: double.infinity,
                padding: EdgeInsets.zero,
                boxShadow: [],
                backgroundColor: contentBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    SellerProducts(
                      products: seller.products,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingSize,
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                backgroundColor: Colors.white,
                border: const BorderSide(),
                child: Text(
                  "Sorting",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: CustomButton(
                child: Text(
                  "Follow",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SellerInfoItem extends StatelessWidget {
  const SellerInfoItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: Color(0XFF838589),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
