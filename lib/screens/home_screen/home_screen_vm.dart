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
  bool isloading = false;

  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get getLoaderStream => _loaderController.stream;

  setData(List<UserModel> data) {
    userData = data;
    listUser = userData.skip(pageCount * itemCount).take(itemCount).toList();
    Provider.of<DataProvider>(parentContext!, listen: false).updateUserDataList(
        userData.skip(pageCount * itemCount).take(itemCount).toList());
  }

  loadMoreData() async {
    print(pageCount);
    Future.delayed(Duration(seconds: 50));
    isloading = true;
    _loaderSink.add(isloading);
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
      /* await Future.delayed(Duration(seconds: 50)); */

      Provider.of<DataProvider>(parentContext!, listen: false)
          .updateUserDataList(listUser);
    } else {
      ShowToast(
              title: "",
              message: "You viewed all the data",
              parentContext: parentContext!)
          .show();
    }
    isloading = false;
    _loaderSink.add(isloading);
  }
}
