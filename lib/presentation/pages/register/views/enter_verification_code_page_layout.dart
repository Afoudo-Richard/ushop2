import 'package:flutter/services.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/register/views/enter_name_password_page_layout.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class EnterVerificationCodePageLayout extends StatelessWidget {
  const EnterVerificationCodePageLayout({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const EnterVerificationCodePageLayout());
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
                    "Verification",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text(
                      "We have sent the verification code to +628*******716",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Change?",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Verification Code",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () => print("Re-sending code now"),
                      child: Text(
                        "Re-send Code",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 15.w,
                      child: CustomInput(
                        backgroundColor: inputBackgroundColor,
                        labelTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        inputKeyBoardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                      child: CustomInput(
                        backgroundColor: inputBackgroundColor,
                        labelTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        inputKeyBoardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                      child: CustomInput(
                        backgroundColor: inputBackgroundColor,
                        labelTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        inputKeyBoardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                      child: CustomInput(
                        backgroundColor: inputBackgroundColor,
                        labelTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                        inputKeyBoardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Send code reload in",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      "3:04",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
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
                        context, EnterNamePasswordPageLayout.route()),
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
