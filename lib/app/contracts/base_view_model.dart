import 'package:data_book/app/contracts/app_model.dart';
import 'package:flutter/material.dart';

abstract class BaseViewModel {
  BuildContext? parentContext;
  AppModel? appModel = AppModel();

  void setContext(BuildContext context) {
    this.parentContext = context;
  }

  void dispose();
}
