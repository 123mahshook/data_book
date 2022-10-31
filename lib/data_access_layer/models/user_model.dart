import 'package:data_book/app/contracts/convert_services.dart';

class UserModel {
  String? userId;
  String? id;
  String? title;
  String? body;

  UserModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userId: ConvertService.convertString(json["userId"]),
      id: ConvertService.convertString(json["id"]),
      title: ConvertService.convertString(json["title"]),
      body: ConvertService.convertString(json["body"]));

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };

  static List<UserModel> parseItems(productJson) {
    try {
      var list = productJson as List;
      if (list != null) {
        List<UserModel> pros =
            list.map((data) => UserModel.fromJson(data)).toList();
        return pros;
      }
    } catch (_) {}
    return [];
  }

  static UserModel? parseItem(json) {
    if (json != null) {
      return UserModel.fromJson(json);
    }
    return null;
  }

  UserModel copyItem() => UserModel(
        userId: userId,
        id: id,
        title: title,
        body: body,
      );

  List<UserModel> copyItems(List<UserModel> items) {
    return items.map((e) => e.copyItem()).toList();
  }

  static UserModel initData() => UserModel(
        userId: "",
        id: "",
        title: "",
        body: "",
      );
}
