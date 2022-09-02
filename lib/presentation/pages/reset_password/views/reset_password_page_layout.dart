import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class ResetPasswordPageLayout extends StatelessWidget {
  const ResetPasswordPageLayout({Key? key}) : super(key: key);

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
                  height: 4.h,
                ),
                InkWell(
                  child: Icon(LineIcons.angleLeft),
                  onTap: () => Navigator.pop(context),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  child: Text(
                    "Reset Password",
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
                  "Enter Email / No. Mobile account to reset your password",
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
                  label: "Email/Phone",
                  inputHintText: "Enter your email address/ phone number",
                  backgroundColor: Colors.grey.withOpacity(0.1),
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
                      "Reset",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
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
