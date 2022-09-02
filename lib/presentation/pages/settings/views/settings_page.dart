import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SettingsPage(),
      settings: const RouteSettings(name: "SettingsPage"),
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
          "Settings",
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
          ],
        ),
      ),
    );
  }
}
