import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier implements ReassembleHandler {
  @override
  void reassemble() {
    print('Did hot-reload');
    if (screenSetup != null) {
      screenSetup!.call();
    }
  }

  List<UserModel> userData = [];
  List<UserModel> userDataList = [];
  Function? screenSetup;
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

  setHotReloadDataReset(Function screenHotreload) {
    screenSetup = screenHotreload;
  }
}
