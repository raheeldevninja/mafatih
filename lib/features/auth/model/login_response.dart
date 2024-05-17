import 'package:mafatih/core/models/user.dart';

class LoginResponse {
  User? user;
  String? accessToken;
  bool? success;
  String? message;


  LoginResponse({this.user, this.accessToken, this.success = false, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

