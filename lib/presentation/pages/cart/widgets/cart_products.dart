import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CartItem(
                product: state.cart
                    .productQuantity(state.cart.products)
                    .keys
                    .elementAt(index));
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 2.h,
            );
          },
          itemCount:
              state.cart.productQuantity(state.cart.products).keys.length,
        );
      },
    );
  }
}
