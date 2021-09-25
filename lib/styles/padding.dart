import 'package:flutter/material.dart';

const double smallPadding = 4;
const double mediumPadding = 8;
const double largePadding = 12;
const double largerPadding = 16;

class AppPadding {
  static const small = EdgeInsets.all(smallPadding);
  static const medium = EdgeInsets.all(mediumPadding);
  static const large = EdgeInsets.all(largePadding);
  static const larger = EdgeInsets.all(largerPadding);
  static const paddingThroughOutApp =
      EdgeInsets.symmetric(horizontal: largePadding, vertical: largePadding);
  static const horizontalPaddingThroughOutApp =
      EdgeInsets.symmetric(horizontal: largePadding);
  static const verticalPaddingThroughOutApp =
      EdgeInsets.symmetric(vertical: largePadding);
}
