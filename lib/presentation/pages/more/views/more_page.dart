import 'package:cached_network_image/cached_network_image.dart';

import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/profile/views/profile_page.dart';
import 'package:ushop/presentation/pages/settings/views/settings_page.dart';
import 'package:ushop/utils/utils.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const MorePage(),
      settings: const RouteSettings(name: "MorePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 8.sp, horizontal: paddingSize),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ushop",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "User name",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      UserImageWidget(
                        radius: 40.sp,
                        showEditIcon: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                width: double.infinity,
                padding: EdgeInsets.zero,
                boxShadow: [],
                backgroundColor: contentBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.sp),
                  topRight: Radius.circular(15.sp),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: pagePadding,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        ItemTile(
                          icon: LineIcons.user,
                          title: "Profile",
                          onTap: () =>
                              Navigator.push(context, ProfilePage.route()),
                        ),
                        const ItemTile(
                          icon: LineIcons.addressBook,
                          title: "Address",
                        ),
                        const ItemTile(
                          icon: LineIcons.bell,
                          title: "Notification",
                        ),
                        ItemTile(
                          icon: LineIcons.cog,
                          title: "Setting",
                          onTap: () =>
                              Navigator.push(context, SettingsPage.route()),
                        ),
                        const ItemTile(
                          icon: LineIcons.scroll,
                          title: "Terms & Condition",
                        ),
                        const ItemTile(
                          icon: LineIcons.userShield,
                          title: "Privacy Policy",
                        ),
                        const ItemTile(
                          icon: LineIcons.users,
                          title: "About Us",
                        ),
                        const ItemTile(
                          icon: LineIcons.headset,
                          title: "Contact Us",
                        ),
                        const ItemTile(
                          icon: LineIcons.mobilePhone,
                          title: "App Info",
                        ),
                        const ItemTile(
                          icon: LineIcons.alternateSignOut,
                          title: "Sign out",
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
