import "package:flutter/material.dart";
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/pages/cart/views/cart_page.dart';
import 'package:ushop/utils/utils.dart';

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CartPage.route(),
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CartPage.route(),
                  );
                },
                icon: Icon(
                  LineIcons.shoppingCart,
                  color: secondaryColor,
                  size: 20.sp,
                ),
              ),
              state.cart.products.isNotEmpty
                  ? Positioned(
                      top: 5.sp,
                      right: 6.sp,
                      child: CircleAvatar(
                        radius: 7.sp,
                        backgroundColor: Colors.red,
                        child: Text(
                          state.cart
                              .productQuantity(state.cart.products)
                              .keys
                              .length
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
