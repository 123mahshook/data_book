import 'package:data_book/utilities/size_utils.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getAssetPng(String assetName) {
    return "assets/images/$assetName.png";
  }

  static String getAssetJpg(String assetName) {
    return "assets/images/$assetName.jpg";
  }

  static String getAssetSvg(String assetName) {
    return "assets/images/$assetName.svg";
  }

  static String getAssetRiveAnimation(String assetName) {
    return "assets/animations/$assetName.riv";
  }

  static String getAssetLottie(String assetName) {
    return "assets/lotties/$assetName.json";
  }

  static String getAssetAudio(String assetName) {
    return "assets/audios/$assetName.mp3";
  }
}

Widget verticalSpace(double height) {
  return SizedBox(height: SizeUtils.getHeight(height));
}

Widget horizontalSpace(double width) {
  return SizedBox(width: SizeUtils.getWidth(width));
}
