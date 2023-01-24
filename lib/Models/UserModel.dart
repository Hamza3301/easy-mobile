import 'dart:collection';

import 'package:insta_public_api/models/next_response_model.dart';

class UserModel {
  String? userName;
  String? email;
  String? phone;
  int? timestamp;
  UserModel({
    this.email,
    this.phone,
    this.timestamp,
    this.userName,
  });
  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      email: parsedJson["email"],
      phone: parsedJson["phone"],
      timestamp: parsedJson["timestamp"],
      userName: parsedJson["userName"],
    );
  }
  Map<String, dynamic> SignupToMap() {
    Map<String, dynamic> map = new HashMap<String, dynamic>();
    map["email"] = this.email;
    map["phone"] = this.phone;
    map["timestamp"] = this.timestamp;
    map["userName"] = this.userName;
    return map;
  }
   Map<String, dynamic> userUpdateToMap() {
    Map<String, dynamic> map = new HashMap<String, dynamic>();
    map["email"] = this.email;
    map["phone"] = this.phone;
    map["userName"] = this.userName;
    return map;
  }
}
