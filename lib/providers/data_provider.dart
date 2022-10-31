import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  List<UserModel> userData = [];
  List<UserModel> userDataList = [];

  setUserData(List<UserModel> dt) {
    userData = dt;
    notifyListeners();
  }

  updateUserDataList(List<UserModel> dt) {
    userDataList = dt;
    notifyListeners();
  }
}
