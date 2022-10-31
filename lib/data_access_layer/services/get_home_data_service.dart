import 'dart:convert';

import 'package:data_book/data_access_layer/models/user_model.dart';
import 'package:data_book/network_layer/constants/web_config_constants.dart';
import 'package:http/http.dart' as http;

class GetHomeDataService {
  Future<List<UserModel>> get() async {
    List<UserModel> res = [];
    try {
      var response = await http.get(Uri.parse(fetchUserUrl));

      //Map<String, dynamic> data = jsonDecode(response.body);
      List<UserModel> data = UserModel.parseItems(jsonDecode(response.body));
      return data;
    } catch (_) {
      return res;
    }
  }
}
