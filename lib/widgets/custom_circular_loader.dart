import 'package:data_book/utilities/app_colors.dart';
import 'package:data_book/utilities/size_utils.dart';
import 'package:flutter/material.dart';

class CustomCircularLoader extends StatefulWidget {
  CustomCircularLoader({this.color, this.strokeWidth});
  final Color? color;
  final double? strokeWidth;
  @override
  _CustomCircularLoaderState createState() => _CustomCircularLoaderState();
}

class _CustomCircularLoaderState extends State<CustomCircularLoader> {
  double screenHeight = SizeUtils.getScreenHeight();
  double screenWidth = SizeUtils.getScreenWidth();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .04,
      width: screenHeight * .04,
      child: CircularProgressIndicator(
        strokeWidth: widget.strokeWidth ?? 4,
        valueColor: AlwaysStoppedAnimation(
            widget.color == null ? AppColors.primaryColor : widget.color),
      ),
    );
  }
}
