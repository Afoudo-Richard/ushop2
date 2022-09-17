import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SellPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Post New Ad".tr(),
          style: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        actions: [
          Text(
            "Clear",
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
