import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier implements ReassembleHandler {
  @override
  void reassemble() {
    print('Did hot-reload');
  }

  List<UserModel> userData = [];
  List<UserModel> userDataList = [];
  int total = 0;

  setUserData(List<UserModel> dt) {
    userData = dt;
    //notifyListeners();
  }

  updateUserDataList(List<UserModel> dt) {
    userDataList = dt;
    print("--------");
    print(dt.length);
    notifyListeners();
  }

  /*  Future<int> getMembertotal() async {
    Future.delayed(Duration(seconds: 10));
    total = userData.length;
    notifyListeners();
    return total;
  } */
}
