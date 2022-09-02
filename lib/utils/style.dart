// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF3669C9);
const Color secondaryColor = Color(0xFF333340);
const Color contentBackgroundColor = Color(0XFFE5E5E5);
const Color allGameCardColor = Color.fromRGBO(230, 230, 230, 1);

const double paddingSize = 13;

const EdgeInsets pagePadding =
    EdgeInsets.symmetric(horizontal: paddingSize, vertical: 0);

Size deviceSize(context) => MediaQuery.of(context).size;
double deviceHeight(context) => MediaQuery.of(context).size.height;
double deviceWidth(context) => MediaQuery.of(context).size.width;

/// input background color
Color inputBackgroundColor = Colors.grey.withOpacity(0.1);

class AppColorTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color contentBackgroundColor;

  AppColorTheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.contentBackgroundColor,
  });
}

enum AppTheme {
  Default,
  Dark,
}

final appThemeData = {
  AppTheme.Default: AppColorTheme(
    primaryColor: const Color(0xFF3669C9),
    secondaryColor: const Color(0xFF333340),
    contentBackgroundColor: const Color(0XFFE5E5E5),
  ),
  AppTheme.Dark: AppColorTheme(
    primaryColor: Color.fromARGB(255, 18, 26, 43),
    secondaryColor: const Color(0xFF333340),
    contentBackgroundColor: Color.fromARGB(255, 5, 1, 1),
  ),
};
