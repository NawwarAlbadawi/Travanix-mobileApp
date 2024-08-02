/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';

TouristPlacesModel touristPlacesModelFromJson(String str) => TouristPlacesModel.fromJson(json.decode(str));

String touristPlacesModelToJson(TouristPlacesModel data) => json.encode(data.toJson());

class TouristPlacesModel {
    TouristPlacesModel({
        required this.data,
        required this.message,
        required this.status,
    });

    List<AttractionActivitiesModelData> data;
    String message;
    int status;

    factory TouristPlacesModel.fromJson(Map<dynamic, dynamic> json) => TouristPlacesModel(
        data: List<AttractionActivitiesModelData>.from(json["data"].map((x) => AttractionActivitiesModelData.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}


