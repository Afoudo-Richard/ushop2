import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/presentation/pages/register/views/register_page.dart';
import 'package:ushop/presentation/pages/reset_password/views/reset_password_page.dart';
import 'package:ushop/presentation/screens/main_screen.dart';
import 'package:ushop/utils/utils.dart';
import 'package:formz/formz.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isBlurPassword = true;
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
                    "welcome_back_to".tr() + " Ushop",
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
                  "please_enter_data_to_login".tr(),
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomInput(
                      label: "email".tr(),
                      inputHintText: "enter_email".tr(),
                      backgroundColor: inputBackgroundColor,
                      labelTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (email) => BlocProvider.of<LoginBloc>(context)
                          .add(LoginEmailChanged(email)),
                      inputErrorText:
                          state.email.invalid ? state.email.error : null,
                    );
                  },
                ),
                SizedBox(
                  height: 5.h,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomInput(
                      label: "password".tr(),
                      inputObscureText: isBlurPassword,
                      inputHintText: "enter_password".tr(),
                      backgroundColor: inputBackgroundColor,
                      labelTextStyle: TextStyle(
                        color: Colors.black,
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            isBlurPassword = !isBlurPassword;
                          });
                        },
                        child: Icon(
                          LineIcons.eye,
                          size: 18.sp,
                        ),
                      ),
                      onChanged: (password) =>
                          BlocProvider.of<LoginBloc>(context)
                              .add(LoginPasswordChanged(password)),
                      inputErrorText:
                          state.password.invalid ? state.password.error : null,
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        child: Text(
                          "sign_in".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                        onPressed: () {
                          state.status.isValidated
                              ? Navigator.push(context, MainScreen.route())
                              : BlocProvider.of<LoginBloc>(context)
                                  .add(SubmitInputsChecked());
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    border: const BorderSide(color: primaryColor),
                    backgroundColor: Colors.white,
                    child: Text(
                      "Sign in anoymously".tr(),
                      style: TextStyle(
                        color: primaryColor,
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
                "forgot_password".tr(),
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
                "sign_up".tr(),
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
