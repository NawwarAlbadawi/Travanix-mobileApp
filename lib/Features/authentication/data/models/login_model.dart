/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        required this.accessToken,
        required this.pharmacyId,
        required this.message,
        required this.status,
    });

    String accessToken;
    int pharmacyId;
    String message;
    int status;

    factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        accessToken: json["access_token"],
        pharmacyId: json["pharmacy_id"],
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "access_token": accessToken,
        "pharmacy_id": pharmacyId,
        "message": message,
        "status": status,
    };
}
