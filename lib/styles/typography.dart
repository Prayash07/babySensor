import 'package:flutter/material.dart';

class FontWeightClass {
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semibold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
}

class SizeScale {
  static const double massive2 = 48;
  static const double massive1 = 32;
  static const double large2 = 28;
  static const double large1 = 24;
  static const double regular4 = 20;
  static const double regular3 = 17;
  static const double regular2 = 16;
  static const double regular1 = 14;
  static const double small2 = 12;
  static const double small1 = 10;
}

class ComponentWise {
  TextStyle appTitle(color) => TextStyle(
        fontSize: SizeScale.regular3,
        fontWeight: FontWeightClass.bold,
        height: 1.25,
        color: color,
      );
  TextStyle objectTitle(color) => TextStyle(
      fontSize: SizeScale.large1,
      fontWeight: FontWeightClass.semibold,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle description(color) => TextStyle(
        fontSize: SizeScale.regular3,
        fontWeight: FontWeightClass.regular,
        letterSpacing: 0,
        // height: 1.15,
        color: color,
      );
  TextStyle bodybold(color) => TextStyle(
      fontSize: SizeScale.regular3,
      fontWeight: FontWeightClass.semibold,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle menuItems(color) => TextStyle(
      fontSize: SizeScale.regular2,
      fontWeight: FontWeightClass.medium,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle cardHeader(color) => TextStyle(
      fontSize: SizeScale.regular2,
      fontWeight: FontWeightClass.medium,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle body(color) => TextStyle(
      fontSize: SizeScale.regular2,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 0,
      height: 1.5,
      color: color);
  TextStyle bodySmall(color) => TextStyle(
      fontSize: SizeScale.regular1,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 0,
      height: 1.5,
      color: color);
  TextStyle button(color) => TextStyle(
      fontSize: SizeScale.regular2,
      fontWeight: FontWeightClass.medium,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle overline(color) => TextStyle(
      fontSize: SizeScale.small2,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 1.05,
      height: 1.3,
      color: color);
  TextStyle info(color) => TextStyle(
      fontSize: SizeScale.small2,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 0,
      height: 1.3,
      color: color);
  TextStyle captions(color) => TextStyle(
      fontSize: SizeScale.regular1,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 0,
      height: 1.5,
      color: color);
  TextStyle taglabels(color) => TextStyle(
      fontSize: SizeScale.regular1,
      fontWeight: FontWeightClass.medium,
      letterSpacing: 0,
      height: 1.3,
      color: color);

  TextStyle formInput(color) => TextStyle(
      fontSize: SizeScale.regular2,
      fontWeight: FontWeightClass.medium,
      letterSpacing: 0,
      height: 1.5,
      color: color);
  TextStyle formLabel(color) => TextStyle(
      fontSize: SizeScale.regular1,
      fontWeight: FontWeightClass.semibold,
      letterSpacing: 1.3,
      height: 1.5,
      color: color);
  TextStyle amount(color) => TextStyle(
      fontSize: SizeScale.regular1,
      fontWeight: FontWeightClass.medium,
      letterSpacing: -1.02,
      height: 1.5,
      color: color);
  TextStyle cardValue(color) => TextStyle(
      fontSize: SizeScale.massive1,
      fontWeight: FontWeightClass.light,
      letterSpacing: -1.5,
      height: 1.5,
      color: color);
  TextStyle helper(color) => TextStyle(
      fontSize: SizeScale.small2,
      fontWeight: FontWeightClass.regular,
      letterSpacing: 0,
      height: 1.3,
      color: color);
}
