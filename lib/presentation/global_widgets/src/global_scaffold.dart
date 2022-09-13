import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';

class GlobalScaffold extends StatelessWidget {
  const GlobalScaffold({Key? key, required this.child}) : super(key: key);

  final Widget child;

  singleScaffoldMessenger(
    context, {
    required Color backgroundColor,
    required String textMessage,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: backgroundColor,
          content: Text(textMessage),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<WishListBloc, WishListState>(
            listener: (context, state) {
              switch (state.productStatus) {
                case WishListStatus.productAdded:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.green,
                    textMessage: "Product Successfully Added to your wishlist",
                  );

                  break;
                case WishListStatus.productRemoved:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.orange,
                    textMessage: "Product Removed from your wishlist",
                  );
                  break;
                case WishListStatus.cleared:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.red,
                    textMessage: "Wishlist cleared",
                  );

                  break;

                default:
              }
            },
          ),
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              switch (state.status) {
                case CartStatus.productAdded:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.green,
                    textMessage: "Product Successfully Added to your cart",
                  );

                  break;
                case CartStatus.productRemoved:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.orange,
                    textMessage: "Product Removed from your cart",
                  );
                  break;

                case CartStatus.cleared:
                  singleScaffoldMessenger(
                    context,
                    backgroundColor: Colors.red,
                    textMessage: "Entire Cart cleared",
                  );

                  break;

                default:
              }
            },
          )
        ],
        child: child,
      ),
    );
  }
}
