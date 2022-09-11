import 'package:easy_localization/easy_localization.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/home/widgets/widgets.dart';
import 'package:ushop/presentation/pages/wishlist/widgets/wishlist_products.dart';
import 'package:ushop/utils/utils.dart';

class WishListPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => WishListPage(),
      settings: RouteSettings(name: "WishListPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "wishlist".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.bell,
              color: secondaryColor,
            ),
          ),
          CartButton(),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<WishListBloc, WishListState>(
          builder: (context, state) {
            return state.wishList.products.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        const SearchInput(),
                        SizedBox(
                          height: 2.h,
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
                                height: 4.h,
                              ),
                              const WishListProducts(),
                              SizedBox(
                                height: 4.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "no_product_in_your_wishlist".tr(),
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
