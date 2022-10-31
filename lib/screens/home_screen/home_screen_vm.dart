import 'dart:async';

import 'package:data_book/app/contracts/base_view_model.dart';
import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:data_book/providers/data_provider.dart';
import 'package:data_book/utilities/show_toast.dart';
import 'package:provider/provider.dart';

class HomeScreenVM extends BaseViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }
  List<UserModel> userData = [];
  List<UserModel> listUser = [];

  int pageCount = 0;
  int itemCount = 10;

  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get getLoaderStream => _loaderController.stream;

  setData(List<UserModel> data) {
    userData = data;
    listUser = userData.skip(pageCount * itemCount).take(itemCount).toList();
    Provider.of<DataProvider>(parentContext!, listen: false).updateUserDataList(
        userData.skip(pageCount * itemCount).take(itemCount).toList());
  }

  loadMoreData() {
    _loaderSink.add(true);
    if (Provider.of<DataProvider>(parentContext!, listen: false)
            .userData
            .length >
        Provider.of<DataProvider>(parentContext!, listen: false)
            .userDataList
            .length) {
      pageCount++;
      List<UserModel> tempSet =
          userData.skip(pageCount * itemCount).take(itemCount).toList();
      listUser.addAll(tempSet);
      Provider.of<DataProvider>(parentContext!, listen: false)
          .updateUserDataList(listUser);
    } else {
      ShowToast(
              title: "",
              message: "You viewed all the data",
              parentContext: parentContext!)
          .show();
    }
    _loaderSink.add(false);
  }
}
