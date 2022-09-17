import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButton extends StatefulWidget {
  const CallButton({super.key});

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  bool isShowingPhone = false;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10)),
      padding: EdgeInsets.all(5.sp),
      border: const BorderSide(color: primaryColor),
      backgroundColor: Colors.white,
      child: Text(
        isShowingPhone ? "+237672367020" : "Call".tr(),
        style: TextStyle(
          color: primaryColor,
          fontSize: 12.sp,
        ),
      ),
      onPressed: () {
        isShowingPhone
            ? launchUrl(Uri(
                scheme: "tel",
                path: "+237672367030",
              ))
            : setState(() {
                isShowingPhone = true;
              });
      },
    );
  }
}
