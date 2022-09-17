import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/home/widgets/trending.dart';
import 'package:ushop/presentation/pages/home/widgets/widgets.dart';
import 'package:ushop/utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomePage(),
      settings: const RouteSettings(name: "HomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: appBar(
        title: "Ushop",
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
                    const Trending(),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
