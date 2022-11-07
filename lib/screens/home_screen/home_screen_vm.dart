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

/*   final _dataController = StreamController<List<UserModel>>.broadcast();
  StreamSink<List<UserModel>> get _dataSink => _dataController.sink;
  Stream<List<UserModel>> get getDataStream => _dataController.stream; */

  setData(List<UserModel> data) {
    userData = data;
    listUser = userData.skip(pageCount * itemCount).take(itemCount).toList();
    /*  _dataSink.add(listUser); */
    Provider.of<DataProvider>(parentContext!, listen: false).updateUserDataList(
        userData.skip(pageCount * itemCount).take(itemCount).toList());
    /*   Provider.of<TotalCount>(parentContext!, listen: false)
        .setCounter(data.length); */
  }

  loadMoreData() async {
    isloading = true;
    print(pageCount);
    await Future.delayed(Duration(seconds: 5));

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
      /*  _dataSink.add(listUser); */
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

/*   Stream<String> get DataStreamList async* {
    while (i < 85) {
      await Future.delayed(Duration(seconds: 1), () {
        i++;
      });
      yield i.toString();
    }
  } */
}
