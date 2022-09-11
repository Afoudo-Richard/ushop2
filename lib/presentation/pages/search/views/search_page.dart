import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/search/views/search_page_layout.dart';
import 'package:ushop/presentation/pages/search/widgets/latest_searched.dart';
import 'package:ushop/presentation/pages/search/widgets/no_products.dart';
import 'package:ushop/presentation/pages/search/widgets/product_search_input.dart';
import 'package:ushop/utils/utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SearchPage());
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
          "search".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const ProductSearchInput(),
                SizedBox(
                  height: 3.h,
                ),
                const LatestSearched(),
                const NoProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
