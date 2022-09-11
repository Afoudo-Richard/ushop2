import 'package:easy_localization/easy_localization.dart';
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
                    "register_account".tr(),
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                CustomInput(
                  label: "email".tr(),
                  inputHintText: "enter_email".tr(),
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
                      "continue".tr(),
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
                      "have_an_account?".tr(),
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
                        "sign_in".tr(),
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
