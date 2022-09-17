import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ushop/blocs/blocs.dart';

import 'package:ushop/data/src/mock_data.dart';
import 'package:ushop/data/src/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/image_preview/views/image_preview_page.dart';
import 'package:ushop/presentation/pages/product_detail/widgets/reviews_section.dart';
import 'package:ushop/presentation/pages/seller_info/views/seller_info_page.dart';

import 'package:ushop/utils/utils.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  Seller seller = listOfSellers[0];

  static Route route(Product product) {
    return MaterialPageRoute<void>(
        builder: (_) => ProductDetailPage(
              product: product,
            ));
  }

  MultiImageProvider multiImageProvider = MultiImageProvider([
    Image.network("https://picsum.photos/id/1001/5616/3744").image,
    Image.network("https://picsum.photos/id/1003/1181/1772").image,
    Image.network("https://picsum.photos/id/1004/5616/3744").image,
    Image.network("https://picsum.photos/id/1005/5760/3840").image
  ]);

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
          "product_detail".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              LineIcons.share,
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
                    InkWell(
                      onTap: () {
                        // showImageViewerPager(
                        //   context,
                        //   multiImageProvider,
                        //   onPageChanged: (page) {
                        //     print("page changed to $page");
                        //   },
                        //   onViewerDismissed: (page) {
                        //     print("dismissed while on page $page");
                        //   },
                        //   backgroundColor: primaryColor.withOpacity(0.4),
                        //   closeButtonColor: Colors.white,
                        //   swipeDismissible: true,
                        // );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImagePreviewPage(
                                      images: [
                                        CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: primaryColor,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          imageUrl: product.image,
                                        ),
                                        CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: primaryColor,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          imageUrl: product.image,
                                        ),
                                        CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: primaryColor,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          imageUrl: product.image,
                                        ),
                                        CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(
                                              backgroundColor: primaryColor,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          imageUrl: product.image,
                                        ),
                                      ],
                                    )));
                      },
                      child: CustomContainer(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.green,
                        width: 100.w,
                        height: 40.h,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: primaryColor,
                              color: secondaryColor,
                            ),
                          ),
                          imageUrl: product.image,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "\$ ${product.price}",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
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
                                  "${product.avg_rating}",
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "${product.total_reviews} " + "reviews".tr(),
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        CustomContainer(
                          padding: EdgeInsets.all(6),
                          boxShadow: [],
                          backgroundColor: Colors.green.withOpacity(0.2),
                          child: Row(
                            children: [
                              Text(
                                "available".tr() +
                                    " : ${product.total_available}",
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 2.h,
                    ),
                    SellerName(
                      shop_logo_image: seller.shop_logo_image,
                      name: seller.name,
                      isApproved: seller.isApproved,
                      trailing: Icon(
                        LineIcons.angleRight,
                        size: 20.sp,
                      ),
                      onTap: () => Navigator.push(
                        context,
                        SellerInfoPage.route(seller),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "product_description".tr(),
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(),
                    SizedBox(
                      height: 2.h,
                    ),
                    const ReviewsSection(),
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
                      height: 2.h,
                    ),
                    const FeaturedProductSection(),
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
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: paddingSize,
          vertical: 8,
        ),
        child: CallButton(),
      ),
    );
  }
}
