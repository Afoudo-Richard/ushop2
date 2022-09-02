import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/home/widgets/widgets.dart';
import 'package:ushop/utils/utils.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => HomePage(),
      settings: const RouteSettings(name: "HomePage"),
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
          "Ushop",
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
        child: SingleChildScrollView(
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
              const CategorySection(),
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
                      height: 2.h,
                    ),
                    const FeaturedProductSection(),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Padding(
                      padding: pagePadding,
                      child: ShopNow(
                        title: "CO2 - Cable Multifunction",
                        bgColor: Color(0XFF0ACF83),
                        imagefile: 'assets/images/product_images/product1.png',
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const BestSellersSection(),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Padding(
                      padding: pagePadding,
                      child: ShopNow(
                        title: "Modular Headphone",
                        bgColor: Color(0XFF3669C9),
                        imagefile: 'assets/images/product_images/product3.png',
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const NewArrivalsSection(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const LatestNewsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
