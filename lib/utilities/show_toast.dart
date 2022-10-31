import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';

class ShowToast {
  final String title;
  final String message;
  final BuildContext parentContext;
  final String actionTitle;
  final Color toastBgColor;
  final Color textColor;

  ShowToast(
      {required this.title,
      required this.message,
      required this.parentContext,
      this.actionTitle = "OK",
      this.toastBgColor = Colors.black,
      this.textColor = Colors.white});

  show() {
    if (Platform.isIOS) {
      showDialog(
          context: parentContext,
          builder: (context) => CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(parentContext);
                      },
                      child: Text(actionTitle)),
                ],
              ));
    } else {
      Fluttertoast.showToast(
          msg: message,
          //toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: toastBgColor,
          textColor: textColor,
          fontSize: 16.0);
    }
  }
}
