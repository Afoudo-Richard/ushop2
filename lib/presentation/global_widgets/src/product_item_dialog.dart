import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:formz/formz.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/src/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class ProductItemDialog extends StatelessWidget {
  const ProductItemDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SectionHeader(
                    title: "Product Action",
                    trailing: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        LineIcons.times,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      BlocBuilder<WishListBloc, WishListState>(
                        builder: (context, state) {
                          return !state.wishList.productInWishList(product)
                              ? InkWell(
                                  onTap: () {
                                    BlocProvider.of<WishListBloc>(context).add(
                                      WishListProductAdded(product: product),
                                    );
                                  },
                                  child: Text(
                                    "Add to Wishlist",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    BlocProvider.of<WishListBloc>(context).add(
                                      WishListProductRemoved(product: product),
                                    );
                                  },
                                  child: Text(
                                    "Remove from Wishlist",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                );
                        },
                      ),
                      Divider(
                        height: 4.h,
                      ),
                      InkWell(
                        onTap: () => Share.share("This will be the news url.",
                            subject: 'Share article'),
                        child: Text(
                          "Share Product",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          return state.cart.productInCart(product)
                              ? SizedBox(
                                  width: 100.w,
                                  child: CustomButton(
                                    backgroundColor: Colors.red,
                                    onPressed: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                        CartProductRemoved(
                                          product: product,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Remove from Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  width: 100.w,
                                  child: CustomButton(
                                    onPressed: () {
                                      BlocProvider.of<CartBloc>(context).add(
                                        CartProductAdded(
                                          product: product,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ],
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
