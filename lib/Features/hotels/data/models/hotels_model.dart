/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'hotel_data_model.dart';

HotelsModel hotelsModelFromJson(String str) => HotelsModel.fromJson(json.decode(str));

String hotelsModelToJson(HotelsModel data) => json.encode(data.toJson());

class HotelsModel {
    HotelsModel({
        required this.data,
        required this.message,
        required this.status,
    });

    List<HotelData> data;
    String message;
    int status;

    factory HotelsModel.fromJson(Map<dynamic, dynamic> json) => HotelsModel(
        data: List<HotelData>.from(json["data"].map((x) => HotelData.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}


