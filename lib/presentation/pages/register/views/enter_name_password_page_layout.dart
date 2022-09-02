import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/screens/main_screen.dart';
import 'package:ushop/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class EnterNamePasswordPageLayout extends StatelessWidget {
  const EnterNamePasswordPageLayout({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const EnterNamePasswordPageLayout());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  child: Text(
                    "Profile & Password",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Complete the following latest data to enter the Ushop Mall application",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomInput(
                  label: "Full Name",
                  inputHintText: "Enter your full",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomInput(
                  label: "Password",
                  inputObscureText: true,
                  inputHintText: "Enter Account Password",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                  trailing: Icon(
                    LineIcons.eye,
                    size: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomInput(
                  label: "Referal Code (Optional)",
                  inputHintText: "Input your code",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    child: Text(
                      "Confirmation",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () =>
                        Navigator.push(context, MainScreen.route()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
