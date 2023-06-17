import 'package:flutter/material.dart';

class AppDimens {

  static double defaultHeight = 640;
  static double defaultWidth = 360;

  static double statusBarPadding(BuildContext context) => MediaQuery.of(context).padding.top;

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  //////////////////////////////////////////////////////////////////////////////////////

  static double dpWidthMargin(BuildContext context,double dp) => screenWidth(context) / (defaultWidth / dp);

  //////////////////////////////////////////////////////////////////////////////////////

  static double dpHeightMargin(BuildContext context,double dp) => screenHeight(context) / (defaultHeight / dp);

}
