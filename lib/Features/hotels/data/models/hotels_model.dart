/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

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

class HotelData {
    HotelData({
        required this.images,
        required this.address,
        required this.coordinateX,
        required this.coordinateY,

        required this.services,
        required this.nationName,
        required this.hotelName,
        required this.hotelClass,
        required this.cityName,
        required this.simpleDescriptionAboutHotel,
        required this.phoneNumber,
        required this.id,
        required this.favorite,
    });

    List<String> images;
    String address;
    double coordinateX;
    double coordinateY;

    List<String> services;
    String nationName;
    String hotelName;
    double  hotelClass;
    String cityName;
    String simpleDescriptionAboutHotel;
    String phoneNumber;
    int id;
    bool favorite;

    factory HotelData.fromJson(Map<dynamic, dynamic> json) => HotelData(
        images: List<String>.from(json["images"].map((x) => x)),
        address: json["address"],
        coordinateX: json["coordinate_x"],
        coordinateY: json["coordinate_y"],

        services: List<String>.from(json["services"].map((x) => x)),
        nationName: json["nation_name"],
        hotelName: json["hotel_name"],
        hotelClass: json["hotel_class"].toDouble(),
        cityName: json["city_name"],
        simpleDescriptionAboutHotel: json["simple_description_about_hotel"],
        phoneNumber: json["phone_number"],
        id: json["id"],
        favorite: json["favorite"],
    );

    Map<dynamic, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x)),
        "address": address,
        "coordinate_x": coordinateX,
        "coordinate_y": coordinateY,

        "services": List<dynamic>.from(services.map((x) => x)),
        "nation_name": nationName,
        "hotel_name": hotelName,
        "hotel_class": hotelClass,
        "city_name": cityName,
        "simple_description_about_hotel": simpleDescriptionAboutHotel,
        "phone_number": phoneNumber,
        "id": id,
        "favorite": favorite,
    };
}
