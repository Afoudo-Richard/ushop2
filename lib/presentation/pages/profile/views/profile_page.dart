import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/pages/profile/widgets/user_info.dart';
import 'package:ushop/presentation/pages/profile_update/views/profile_update_page.dart';
import 'package:ushop/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ProfilePage(),
      settings: const RouteSettings(name: "ProfilePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(
            LineIcons.angleLeft,
            color: Colors.black,
          ),
          onTap: () => Navigator.pop(context),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          "profile".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 3.h,
            ),
            const UserInfo(),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: CustomContainer(
                width: double.infinity,
                padding: EdgeInsets.zero,
                boxShadow: [],
                backgroundColor: contentBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
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
                          icon: LineIcons.edit,
                          title: "update_profile".tr(),
                          onTap: () => Navigator.push(
                              context, ProfileUpdatePage.route()),
                        ),
                        ItemTile(
                          icon: LineIcons.trash,
                          title: "delete_profile".tr(),
                        ),
                        SizedBox(
                          height: 2.h,
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
