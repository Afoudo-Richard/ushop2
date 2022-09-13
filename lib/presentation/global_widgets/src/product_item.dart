import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/src/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/product_detail/views/product_detail_page.dart';
import 'package:ushop/utils/style.dart';
import "package:flutter/material.dart";
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProductItemDialog(
              product: product,
            );
          },
        );
      },
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
        width: 41.w,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        product.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "\$ ${product.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
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
                                    size: 12.sp,
                                  ),
                                  Text(
                                    product.avg_rating.toString(),
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                "${product.total_reviews} " + "reviews".tr(),
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ProductItemDialog(
                                    product: product,
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.more_vert,
                              size: 20,
                            ),
                          ),
                          // PopupMenuButton(
                          //   child: Container(
                          //     child: Icon(
                          //       Icons.more_vert,
                          //       size: 20,
                          //     ),
                          //   ),
                          //   offset: Offset(0, 20),
                          //   itemBuilder: (context) => [
                          //     PopupMenuItem(
                          //       child: SizedBox(
                          //         width: 100,
                          //         child: CustomButton(
                          //           padding: EdgeInsets.zero,
                          //           backgroundColor: secondaryColor,
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               const Icon(
                          //                 Icons.share,
                          //                 size: 20,
                          //                 color: primaryColor,
                          //               ),
                          //               SizedBox(
                          //                 width: deviceWidth(context) * 0.02,
                          //               ),
                          //               Text(
                          //                 "Share",
                          //                 style: TextStyle(
                          //                   color: primaryColor,
                          //                   fontSize: 14,
                          //                   letterSpacing: 1.5,
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            BlocBuilder<WishListBloc, WishListState>(
              builder: (context, state) {
                return Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      state.wishList.productInWishList(product)
                          ? BlocProvider.of<WishListBloc>(context).add(
                              WishListProductRemoved(product: product),
                            )
                          : BlocProvider.of<WishListBloc>(context).add(
                              WishListProductAdded(product: product),
                            );
                    },
                    child: Icon(
                      state.wishList.productInWishList(product)
                          ? LineIcons.heartAlt
                          : LineIcons.heart,
                      color: state.wishList.productInWishList(product)
                          ? primaryColor
                          : Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
