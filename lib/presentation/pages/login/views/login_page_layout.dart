import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/register/views/register_page.dart';
import 'package:ushop/presentation/pages/reset_password/views/reset_password_page.dart';
import 'package:ushop/presentation/screens/main_screen.dart';

import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class LoginPageLayout extends StatelessWidget {
  const LoginPageLayout({Key? key}) : super(key: key);

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
                    "Welcome back to Ushop",
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
                  "Please enter data to login",
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
                  height: 10.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    child: Text(
                      "Sign In",
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: paddingSize,
          vertical: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Navigator.push(context, ResetPasswordPage.route()),
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(context, RegisterPage.route()),
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
