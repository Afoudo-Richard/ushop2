import 'package:flutter/material.dart';
import 'package:ushop/utils/style.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.child,
    this.padding,
    this.border,
    this.backgroundImage,
    this.width,
    this.height,
    this.boxShadow,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final DecorationImage? backgroundImage;
  final double? width;
  final double? height;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        image: backgroundImage,
        boxShadow: boxShadow ??
            const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
      ),
      child: child,
    );
  }
}
