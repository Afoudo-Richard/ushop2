import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class WishListProducts extends StatelessWidget {
  const WishListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, state) {
        return GridView.builder(
          padding: pagePadding,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.wishList.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProductItem(
              product: state.wishList.products[index],
            );
          },
        );
      },
    );
  }
}
