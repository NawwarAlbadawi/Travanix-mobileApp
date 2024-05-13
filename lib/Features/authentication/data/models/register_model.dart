/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        required this.accessToken,
        required this.message,
        required this.status,
    });

    String accessToken;
    String message;
    int status;

    factory RegisterModel.fromJson(Map<dynamic, dynamic> json) => RegisterModel(
        accessToken: json["access_token"],
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "access_token": accessToken,
        "message": message,
        "status": status,
    };
}
