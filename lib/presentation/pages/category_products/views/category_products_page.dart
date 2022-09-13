import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ushop/data/src/mock_data.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/category_products/widgets/category_search_input.dart';
import 'package:ushop/utils/utils.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({Key? key, required this.category_name})
      : super(key: key);

  final String category_name;

  static Route route({required String category_name}) {
    return MaterialPageRoute<void>(
        builder: (_) => CategoryProductsPage(
              category_name: category_name,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.5,
        leading: InkWell(
          child: const Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Category",
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
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
              Padding(
                padding: pagePadding,
                child: Text(
                  category_name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const CategorySearchInput(),
              SizedBox(
                height: 3.h,
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
                    GridView.builder(
                      padding: pagePadding,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listOfProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductItem(
                          product: listOfProducts[
                              Random().nextInt(listOfProducts.length)],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: pagePadding,
        child: SizedBox(
          width: double.infinity,
          child: CustomButton(
            backgroundColor: Colors.white,
            border: const BorderSide(),
            child: Text(
              "Filter & Sorting",
              style: TextStyle(
                color: Color.fromARGB(255, 37, 35, 35),
                fontSize: 12.sp,
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                barrierColor: primaryColor.withOpacity(0.7),
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return const FilterSorting();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
