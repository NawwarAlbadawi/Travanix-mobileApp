/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

FavoriteModel favoriteModelFromJson(String str) => FavoriteModel.fromJson(json.decode(str));

String favoriteModelToJson(FavoriteModel data) => json.encode(data.toJson());

class FavoriteModel {
    FavoriteModel({
        required this.resturants,
        required this.hotels,
        required this.trips,
        required this.attractionActivities,
        required this.message,
        required this.status,
    });

    List<Resturant> resturants;
    List<Hotel> hotels;
    List<dynamic> trips;
    List<AttractionActivity> attractionActivities;
    String message;
    int status;

    factory FavoriteModel.fromJson(Map<dynamic, dynamic> json) => FavoriteModel(
        resturants: List<Resturant>.from(json["resturants"].map((x) => Resturant.fromJson(x))),
        hotels: List<Hotel>.from(json["hotels"].map((x) => Hotel.fromJson(x))),
        trips: List<dynamic>.from(json["trips"].map((x) => x)),
        attractionActivities: List<AttractionActivity>.from(json["attraction_activities"].map((x) => AttractionActivity.fromJson(x))),
        message: json["message"],
        status: json["status"],
    );

    Map<dynamic, dynamic> toJson() => {
        "resturants": List<dynamic>.from(resturants.map((x) => x.toJson())),
        "hotels": List<dynamic>.from(hotels.map((x) => x.toJson())),
        "trips": List<dynamic>.from(trips.map((x) => x)),
        "attraction_activities": List<dynamic>.from(attractionActivities.map((x) => x.toJson())),
        "message": message,
        "status": status,
    };
}

class AttractionActivity {
    AttractionActivity({
        required this.name,
        required this.cityName,
        required this.images,
        required this.address,
        required this.coordinateX,
        required this.coordinateY,
        required this.closingTime,
        required this.openingTime,
        required this.description,
        required this.id,
        required this.favorite,
        required this.nationName,
    });

    String name;
    String cityName;
    List<String> images;
    String address;
    int coordinateX;
    int coordinateY;
    String closingTime;
    String openingTime;
    String description;
    int id;
    bool favorite;
    String nationName;

    factory AttractionActivity.fromJson(Map<dynamic, dynamic> json) => AttractionActivity(
        name: json["attraction_activity_name"],
        cityName: json["city_name"],
        images: List<String>.from(json["images"].map((x) => x)),
        address: json["address"],
        coordinateX: json["coordinate_x"],
        coordinateY: json["coordinate_y"],
        closingTime: json["closing_time"],
        openingTime: json["opening_time"],
        description: json["description"],
        id: json["id"],
        favorite: json["favorite"],
        nationName: json["nation_name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "attraction_activity_name": name,
        "city_name": cityName,
        "images": List<dynamic>.from(images.map((x) => x)),
        "address": address,
        "coordinate_x": coordinateX,
        "coordinate_y": coordinateY,
        "closing_time": closingTime,
        "opening_time": openingTime,
        "description": description,
        "id": id,
        "favorite": favorite,
        "nation_name": nationName,
    };
}

class Hotel {
    Hotel({
        required this.images,
        required this.address,
        required this.coordinateX,
        required this.coordinateY,
        required this.services,
        required this.nationName,
        required this.name,
        required this.rating,
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
    String name;
    int rating;
    String cityName;
    String simpleDescriptionAboutHotel;
    String phoneNumber;
    int id;
    bool favorite;

    factory Hotel.fromJson(Map<dynamic, dynamic> json) => Hotel(
        images: List<String>.from(json["images"].map((x) => x)),
        address: json["address"],
        coordinateX: json["coordinate_x"]?.toDouble(),
        coordinateY: json["coordinate_y"]?.toDouble(),
        services: List<String>.from(json["services"].map((x) => x)),
        nationName: json["nation_name"],
        name: json["hotel_name"],
        rating: json["hotel_class"],
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
        "hotel_name": name,
        "hotel_class": rating,
        "city_name": cityName,
        "simple_description_about_hotel": simpleDescriptionAboutHotel,
        "phone_number": phoneNumber,
        "id": id,
        "favorite": favorite,
    };
}

class Resturant {
    Resturant({
        required this.rating,
        required this.descreption,
        required this.images,
        required this.address,
        required this.coordinateX,
        required this.coordinateY,
        required this.opiningTime,
        required this.nationName,
        required this.cityName,
        required this.typeOfFood,
        required this.closingTime,
        required this.name,
        required this.phoneNumber,
        required this.id,
        required this.favorite,
    });

    double rating;
    String descreption;
    List<String> images;
    String address;
    int coordinateX;
    int coordinateY;
    String opiningTime;
    String nationName;
    String cityName;
    String typeOfFood;
    String closingTime;
    String name;
    String phoneNumber;
    int id;
    bool favorite;

    factory Resturant.fromJson(Map<dynamic, dynamic> json) => Resturant(
        rating: json["resturant_class"]?.toDouble(),
        descreption: json["descreption"],
        images: List<String>.from(json["images"].map((x) => x)),
        address: json["address"],
        coordinateX: json["coordinate_x"],
        coordinateY: json["coordinate_y"],
        opiningTime: json["opining_time"],
        nationName: json["nation_name"],
        cityName: json["city_name"],
        typeOfFood: json["type_of_food"],
        closingTime: json["closing_time"],
        name: json["resturant_name"],
        phoneNumber: json["phone_number"],
        id: json["id"],
        favorite: json["favorite"],
    );

    Map<dynamic, dynamic> toJson() => {
        "resturant_class": rating,
        "descreption": descreption,
        "images": List<dynamic>.from(images.map((x) => x)),
        "address": address,
        "coordinate_x": coordinateX,
        "coordinate_y": coordinateY,
        "opining_time": opiningTime,
        "nation_name": nationName,
        "city_name": cityName,
        "type_of_food": typeOfFood,
        "closing_time": closingTime,
        "resturant_name": name,
        "phone_number": phoneNumber,
        "id": id,
        "favorite": favorite,
    };
}
