import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

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
                          title: "profile".tr(),
                          onTap: () =>
                              Navigator.push(context, ProfilePage.route()),
                        ),
                        ItemTile(
                          icon: LineIcons.addressBook,
                          title: "address".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.bell,
                          title: "notification".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.cog,
                          title: "settings".tr(),
                          onTap: () =>
                              Navigator.push(context, SettingsPage.route()),
                        ),
                        ItemTile(
                          icon: LineIcons.scroll,
                          title: "terms&condition".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.userShield,
                          title: "privacy_policy".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.users,
                          title: "about_us".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.headset,
                          title: "contact_us".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.mobilePhone,
                          title: "app_info".tr(),
                        ),
                        ItemTile(
                          icon: LineIcons.alternateSignOut,
                          title: "sign_out".tr(),
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
