import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class UserImageWidget extends StatelessWidget {
  const UserImageWidget({
    Key? key,
    this.isEditable = true,
    this.showEditIcon = true,
    required this.radius,
  }) : super(key: key);

  final bool isEditable;
  final double radius;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isEditable
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SelectImageSourceDialog();
                },
              )
            : null;
      },
      child: Stack(
        children: [
          BlocBuilder<UserImageBloc, UserImageState>(
            builder: (context, state) {
              return CustomCircle(
                radius: radius,
                color: Colors.red,
                // child: CachedNetworkImage(
                //   fit: BoxFit.cover,
                //   placeholder: (context, url) => const Center(
                //     child: CircularProgressIndicator(
                //       backgroundColor: primaryColor,
                //       color: secondaryColor,
                //     ),
                //   ),
                //   imageUrl: "https://ui-avatars.com/api/?name=U+Shop",
                // ),
                child: state.pickedFile != null
                    ? Image(
                        image: FileImage(
                          File(state.pickedFile!.path),
                        ),
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: primaryColor,
                            color: secondaryColor,
                          ),
                        ),
                        imageUrl: "https://ui-avatars.com/api/?name=U+Shop",
                      ),
              );
            },
          ),
          showEditIcon
              ? Positioned(
                  bottom: 0,
                  right: 5,
                  child: CustomCircle(
                    radius: 20.sp,
                    padding: EdgeInsets.all(1.sp),
                    color: primaryColor,
                    child: Icon(
                      LineIcons.pen,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
