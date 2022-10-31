import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/size_utils.dart';
import 'package:flutter/material.dart';

class FontUtils {
  static TextStyle getFont9Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(9),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont10Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500,
      FontStyle? fontStyle,
      double? height,
      double? letterSpacing}) {
    return TextStyle(
        fontStyle: fontStyle,
        height: height,
        color: color,
        letterSpacing: letterSpacing,
        fontSize: SizeUtils.getFont(10),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont11Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(11),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont12Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(12),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont13Style(
      {Color color = AppColors.textBlack,
      FontWeight fontWeight = FontWeight.w500,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(13),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont14Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontSize: SizeUtils.getFont(14),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont15Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(15),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont16Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(16),
        fontFamily: "Circular Std",
        decoration: decoration,
        fontWeight: fontWeight);
  }

  static TextStyle getFont17Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w400,
      double? height}) {
    return TextStyle(
        height: height,
        color: color,
        fontSize: SizeUtils.getFont(17),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont18Style(
      {Color color = AppColors.black,
      FontWeight fontWeight = FontWeight.w500,
      double? height}) {
    return TextStyle(
        color: color,
        height: height,
        fontSize: SizeUtils.getFont(18),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont20Style(
      {Color color = AppColors.textBlack,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(20),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont24Style(
      {Color color = AppColors.textBlack,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(24),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }

  static TextStyle getFont30Style({Color color = AppColors.primaryColor}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(30),
        fontFamily: "Circular Std",
        fontWeight: FontWeight.w500);
  }

  static TextStyle getFont32Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(32),
        fontFamily: "Circular Std",
        fontWeight: fontWeight);
  }
}
