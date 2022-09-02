import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ushop/blocs/blocs.dart';
import 'package:ushop/presentation/global_widgets/global_widgets.dart';
import 'package:ushop/utils/utils.dart';

class SelectImageSourceDialog extends StatelessWidget {
  const SelectImageSourceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: SectionHeader(
                    title: "Select Image Source",
                    trailing: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        LineIcons.times,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<UserImageBloc>(context).add(
                              SelectImage(imageSource: ImageSource.gallery));
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Select from gallery",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Divider(
                        height: 4.h,
                      ),
                      InkWell(
                        onTap: () {
                          BlocProvider.of<UserImageBloc>(context).add(
                              SelectImage(imageSource: ImageSource.camera));
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Take a picture",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
