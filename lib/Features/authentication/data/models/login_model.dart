/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.accessToken,

        required this.message,
        required this.status,
    });
    String ? accessToken;
    String message;
    int status;

    factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        accessToken: json["access_token"]!=null?json["access_token"]:null,

        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "access_token": accessToken,

        "message": message,
        "status": status,
    };
}
