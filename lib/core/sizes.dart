import 'package:flutter/material.dart';

class AppSizes{
  static const double paddingBody = 16;
  static const double paddingInside = 10;
  static const double paddingMini = 3;

  static const double iconSmall = 16;
  static const double iconBig = 24;

  static const double radiusSmall = 10;
  static const double radiusBig = 20;

  static const double circleAvatarRadius = 30;

  static height(BuildContext context, double height)=> MediaQuery.of(context).size.height * height / 850;
  static width(BuildContext context, double width)=> MediaQuery.of(context).size.width * width / 390;
}