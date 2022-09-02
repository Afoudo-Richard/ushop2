import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ushop/utils/utils.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ProfileUpdatePage(),
      settings: const RouteSettings(name: "ProfileUpdatePage"),
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
          "Update Profile",
          style: TextStyle(
            fontSize: 20.sp,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                CustomInput(
                  label: "First Name",
                  inputHintText: "Enter your First Name",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomInput(
                  label: "Last Name",
                  inputHintText: "Enter your Last Name",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                CustomInput(
                  label: "Email",
                  inputHintText: "Enter your Email",
                  backgroundColor: inputBackgroundColor,
                  labelTextStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 3.h,
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
                  height: 3.h,
                ),
                CustomInput(
                  label: "Re-enter Password",
                  inputObscureText: true,
                  inputHintText: "Re-enter Password",
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
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    child: Text(
                      "Update Account",
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
