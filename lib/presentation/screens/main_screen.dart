import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/home/views/home_page.dart';
import 'package:ushop/presentation/pages/more/views/more_page.dart';
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
      HomePage(),
      const MorePage(),
    ];
    return Scaffold(
      drawer: const AppDrawer(),
      body: _kTabPages[_currentPage],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 16,
              spreadRadius: 0,
              offset: Offset(0, -8),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 8.0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
          ),
          backgroundColor: Colors.white,
          currentIndex: _currentPage,
          items: [
            _bottomNavItem(
              index: 0,
              label: "HOME",
              icon: LineIcons.home,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            _bottomNavItem(
              index: 1,
              label: "WISHLIST",
              icon: LineIcons.heart,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            _bottomNavItem(
              index: 2,
              label: "ORDER",
              icon: LineIcons.shoppingCart,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            _bottomNavItem(
              index: 3,
              label: "More",
              icon: LineIcons.buffer,
              onTap: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ],
        ),
      ),
    );
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
