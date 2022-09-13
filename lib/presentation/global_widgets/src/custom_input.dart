import 'package:flutter/services.dart';
import 'package:ushop/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.leading,
    this.trailing,
    this.inputTextStyle,
    this.inputHintText,
    this.inputErrorText,
    this.inputBorder,
    this.border,
    this.controller,
    this.textAlign = TextAlign.start,
    this.inputKeyBoardType,
    this.inputObscureText = false,
    this.onChanged,
    this.inputInitialValue,
    this.inputMaxLines = 1,
    this.inputMinLines,
    this.padding,
    this.label,
    this.labelTextStyle,
    this.inputTextCapitalization = TextCapitalization.none,
    this.leadingAndTrailingPosition = CrossAxisAlignment.center,
    this.inputEnabled,
    this.inputFormatters,
    this.autofocus = false,
    this.focusNode,
  }) : super(key: key);

  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? inputTextStyle;
  final String? inputHintText;
  final String? inputErrorText;
  final InputBorder? inputBorder;
  final BoxBorder? border;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final TextInputType? inputKeyBoardType;
  final bool inputObscureText;
  final void Function(String)? onChanged;
  final String? inputInitialValue;
  final int inputMaxLines;
  final int? inputMinLines;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final TextStyle? labelTextStyle;
  final TextCapitalization inputTextCapitalization;
  final CrossAxisAlignment leadingAndTrailingPosition;
  final bool? inputEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;

  List<Widget> get labelWidgets {
    return [
      Text(
        label!,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ).merge(labelTextStyle),
      ),
      SizedBox(
        height: 1.h,
      )
    ];
  }

  TextStyle get inputTextStyles {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      color: primaryColor,
    ).merge(inputTextStyle);
  }

  InputDecoration get inputDecorations {
    return InputDecoration(
      border: inputBorder ?? InputBorder.none,
      hintText: inputHintText,
      contentPadding: EdgeInsets.zero,
      isDense: true,
      // fillColor: Colors.red,
      // filled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...labelWidgets,
        Container(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            border: border,
            borderRadius: borderRadius ??
                const BorderRadius.all(
                  Radius.circular(5),
                ),
          ),
          child: Row(
            crossAxisAlignment: leadingAndTrailingPosition,
            children: [
              if (leading != null) leading!,
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  autofocus: autofocus,
                  controller: controller,
                  minLines: inputMinLines,
                  maxLines: inputObscureText ? 1 : inputMaxLines,
                  initialValue: inputInitialValue,
                  keyboardType: inputKeyBoardType,
                  obscureText: inputObscureText,
                  style: inputTextStyles,
                  decoration: inputDecorations,
                  onChanged: onChanged,
                  textCapitalization: inputTextCapitalization,
                  enabled: inputEnabled,
                  inputFormatters: inputFormatters,
                  textAlign: textAlign,
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
        inputErrorText != null
            ? Padding(
                padding: EdgeInsets.only(left: 10.sp, top: 3.sp),
                child: Text(
                  inputErrorText!,
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
