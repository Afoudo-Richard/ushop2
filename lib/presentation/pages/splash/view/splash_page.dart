import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class SplashPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ushop",
              style: TextStyle(
                fontSize: 30.sp,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
