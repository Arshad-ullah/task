import 'package:flutter/material.dart';
import 'package:task/src/core/constant/color.dart';

Text manropeText({
  required String text,
  Color? color,
  TextAlign? textAlign,
  double? fontSize,
  FontWeight? fontWeight,
  double? letterSpacing,
  Paint? forgroundPaint,
  TextDecoration? decoration,
}) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
      decoration: decoration ?? TextDecoration.none,
      color: color ?? kblackColor,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing ?? 0,
    ),
  );
}
