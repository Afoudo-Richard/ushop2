import 'package:easy_localization/easy_localization.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/global_widgets/src/main_botton_navigation_bar.dart';
import 'package:ushop/presentation/pages/home/views/home_page.dart';
import 'package:ushop/presentation/pages/more/views/more_page.dart';
import 'package:ushop/presentation/pages/sell/views/sell_page.dart';
import 'package:ushop/presentation/pages/wishlist/views/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const MainScreen());
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      HomePage(),
      WishListPage(),
      SellPage(),
      HomePage(),
      const MorePage(),
    ];
    return Scaffold(
        drawer: const AppDrawer(),
        body: BlocBuilder<AppBottomNavigationBarBloc,
            AppBottomNavigationBarState>(
          builder: (context, state) {
            return state.activePage;
          },
        ),
        bottomNavigationBar: const MainBottonNavigationBar());
  }

  BottomNavigationBarItem _bottomNavItem({
    required IconData icon,
    required index,
    required String label,
    required void Function(int x) onTap,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _currentPage == index ? Color(0XFFEEECED) : Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: _getItemColor(index),
                size: 18.sp,
              ),
              Text(
                label,
                style: TextStyle(
                  color: _getItemColor(index),
                  fontSize: 8.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getItemColor(int index) =>
      _currentPage == index ? primaryColor : Colors.grey;
}
