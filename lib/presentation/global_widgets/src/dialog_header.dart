import "package:flutter/material.dart";
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/style.dart';

class DialogHeader extends StatelessWidget {
  const DialogHeader({
    Key? key,
    required this.title,
    this.hasDismissable = true,
  }) : super(key: key);

  final String title;
  final bool hasDismissable;

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: title,
      trailing: hasDismissable
          ? InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                LineIcons.times,
                color: Colors.black,
                size: 20.sp,
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
