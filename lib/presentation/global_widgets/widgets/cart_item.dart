import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CartItemDialog(
                  product: product,
                );
              },
            );
          },
          child: CustomContainer(
            height: 15.h,
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                SizedBox(
                  width: 30.w,
                  height: double.infinity,
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
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return RemoveCartItemDialog(
                                      product: product,
                                    );
                                  },
                                );
                              },
                              child: Icon(
                                LineIcons.trash,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          "\$ ${state.cart.products.firstWhere((item) => item == product).price}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (state.cart.productQuantity(
                                            state.cart.products)[product] ==
                                        1) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RemoveCartItemDialog(
                                            product: product,
                                          );
                                        },
                                      );
                                    } else {
                                      BlocProvider.of<CartBloc>(context).add(
                                        CartProductRemoved(product: product),
                                      );
                                    }
                                  },
                                  child: Icon(
                                    LineIcons.minusCircle,
                                    size: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "${state.cart.productQuantity(state.cart.products)[product]}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                        CartProductAdded(product: product));
                                  },
                                  child: Icon(
                                    LineIcons.plusCircle,
                                    size: 15.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
