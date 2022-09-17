import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/pages/home/views/home_page.dart';
import 'package:ushop/presentation/pages/messages/views/messages_page.dart';
import 'package:ushop/presentation/pages/more/views/more_page.dart';
import 'package:ushop/presentation/pages/sell/views/sell_page.dart';
import 'package:ushop/presentation/pages/wishlist/views/wishlist_page.dart';
import 'package:ushop/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBottonNavigationBar extends StatelessWidget {
  const MainBottonNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:
          BlocBuilder<AppBottomNavigationBarBloc, AppBottomNavigationBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 8.0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
            ),
            backgroundColor: Colors.white,
            currentIndex: 0,
            items: [
              _bottomNavItem(
                active: state.activePage is HomePage,
                label: "home".tr(),
                icon: LineIcons.home,
                onTap: () {
                  BlocProvider.of<AppBottomNavigationBarBloc>(context).add(
                    AppBottomNavigationBarChanged(
                      activePage: const HomePage(),
                    ),
                  );
                },
              ),
              _bottomNavItem(
                active: state.activePage is WishListPage,
                label: "favorite".tr(),
                icon: LineIcons.heart,
                onTap: () {
                  BlocProvider.of<AppBottomNavigationBarBloc>(context).add(
                    AppBottomNavigationBarChanged(
                      activePage: WishListPage(),
                    ),
                  );
                },
              ),
              _bottomNavItem(
                active: state.activePage is SellPage,
                label: "sell".tr(),
                icon: LineIcons.plusCircle,
                onTap: () {
                  BlocProvider.of<AppBottomNavigationBarBloc>(context).add(
                    AppBottomNavigationBarChanged(
                      activePage: const SellPage(),
                    ),
                  );
                },
              ),
              _bottomNavItem(
                active: state.activePage is MessagesPage,
                label: "messages".tr(),
                icon: LineIcons.sms,
                onTap: () {
                  BlocProvider.of<AppBottomNavigationBarBloc>(context).add(
                    AppBottomNavigationBarChanged(
                      activePage: const MessagesPage(),
                    ),
                  );
                },
              ),
              _bottomNavItem(
                active: state.activePage is MorePage,
                label: "more".tr(),
                icon: LineIcons.buffer,
                onTap: () {
                  BlocProvider.of<AppBottomNavigationBarBloc>(context).add(
                    AppBottomNavigationBarChanged(
                      activePage: const MorePage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

BottomNavigationBarItem _bottomNavItem({
  required IconData icon,
  required String label,
  required bool active,
  required void Function() onTap,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: active ? Color(0XFFEEECED) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: active ? primaryColor : Colors.grey,
              size: 18.sp,
            ),
            Text(
              label,
              style: TextStyle(
                color: active ? primaryColor : Colors.grey,
                fontSize: 8.sp,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
