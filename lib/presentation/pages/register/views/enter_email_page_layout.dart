import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/login/views/login_page.dart';
import 'package:ushop/presentation/pages/register/views/enter_verification_code_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class EnterEmailPageLayout extends StatelessWidget {
  const EnterEmailPageLayout({Key? key}) : super(key: key);

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
                    "Register Account",
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
                  "Enter Email / No. Phone to register",
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
                      "Continue",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    onPressed: () => Navigator.push(
                        context, EnterVerificationCodePageLayout.route()),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an Account?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    InkWell(
                      onTap: () =>
                          Navigator.pushReplacement(context, LoginPage.route()),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
