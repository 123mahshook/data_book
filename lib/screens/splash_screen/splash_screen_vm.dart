import 'package:data_book/app/contracts/base_view_model.dart';
import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:data_book/providers/data_provider.dart';
import 'package:data_book/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data_access_layer/services/get_home_data_service.dart';

class SplashScreenVM extends BaseViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  SplashScreenVM() {
    featchHomeData();
  }

  featchHomeData() async {
    List<UserModel> result = await GetHomeDataService().get();
    Provider.of<DataProvider>(parentContext!, listen: false)
        .setUserData(result);
    Navigator.pushReplacementNamed(parentContext!, AppRoutes.homeScreenRoute);
  }
}
