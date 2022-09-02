import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/data/models/models.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class AddToCartDialog extends StatefulWidget {
  const AddToCartDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<AddToCartDialog> createState() => _AddToCartDialogState();
}

class _AddToCartDialogState extends State<AddToCartDialog> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: DialogHeader(
                        title: "Add to Cart",
                      ),
                    ),
                    const Divider(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quantity",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (quantity != 1) {
                                          quantity = quantity - 1;
                                        }
                                      });
                                    },
                                    child: Icon(
                                      LineIcons.minus,
                                      size: 15.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text(
                                    quantity.toString(),
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
                                      setState(() {
                                        quantity = quantity + 1;
                                      });
                                    },
                                    child: Icon(
                                      LineIcons.plus,
                                      size: 15.sp,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Divider(
                            height: 4.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Shopping",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 8.sp,
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "\$ ${double.parse(widget.product.price) * quantity}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          SizedBox(
                            width: 100.w,
                            child: CustomButton(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(
                                  CartProductAdded(
                                    product: widget.product,
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
