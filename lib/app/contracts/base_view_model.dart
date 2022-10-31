import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? parentContext;

  void setContext(BuildContext context) {
    this.parentContext = context;
  }

  void dispose();
}
