import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:formz/formz.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/models/product.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class CartItemDialog extends StatelessWidget {
  const CartItemDialog({
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
                      InkWell(
                        child: Text(
                          "Go to product",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Divider(
                        height: 4.h,
                      ),
                      InkWell(
                        child: Text(
                          "Add to Wishlist",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
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
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddToCartDialog(
                                            product: product,
                                          );
                                        },
                                      );
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
