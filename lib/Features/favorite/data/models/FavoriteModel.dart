import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';
import 'package:travanix/Features/trip/data/TripsModel.dart';

/// status : 1
/// message : "succes get  favorites"
/// trips : []
/// hotels : [{"id":2,"address":"Dubai","coordinate_y":55.188168,"coordinate_x":25.142211,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"In a striking building overlooking the Arabian Gulf, this sprawling beachfront hotel is 11 minutes' walk from Burj Al Arab and 6 km from the Mall of the Emirates.\n                Upscale rooms with gulf views feature decor ranging from modern to muted, plus floor-to-ceiling windows","hotel_name":"Jumeirah Beach Hotel","hotel_class":5,"phone_number":"+971 4 366 5000","images":["/images/hotels/Jumeirah Beach Hotel1.jpg","/images/hotels/Jumeirah Beach Hotel2.jpg","/images/hotels/Jumeirah Beach Hotel3.jpg","/images/hotels/Jumeirah Beach Hotel4.jpg","/images/hotels/Jumeirah Beach Hotel5.jpg","/images/hotels/Jumeirah Beach Hotel6.jpg","/images/hotels/Jumeirah Beach Hotel7.jpg","/images/hotels/Jumeirah Beach Hotel8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"],"favorite":true},{"id":1,"address":"Dubai","coordinate_y":55.185241156464,"coordinate_x":25.141418876386,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"A hotel that's home to cutting-edge engineering from the unique man-made beach and infinity pool terrace, to one of the tallest grand More","hotel_name":"Burj Al Arab","hotel_class":7,"phone_number":"+971 4 301 7777","images":["/images/hotels/Burj Al Arab1.jpg","/images/hotels/Burj Al Arab2.jpg","/images/hotels/Burj Al Arab3.jpg","/images/hotels/Burj Al Arab4.jpg","/images/hotels/Burj Al Arab5.jpg","/images/hotels/Burj Al Arab6.jpg","/images/hotels/Burj Al Arab7.jpg","/images/hotels/Burj Al Arab8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"],"favorite":true}]
/// resturants : [{"id":1,"address":"dfdf","coordinate_y":1,"coordinate_x":1,"city_name":"Damascus","nation_name":"Syrian Arab Republic","type_of_food":"dddddd","descreption":"descreption","resturant_name":"HASSAN","resturant_class":1.2,"phone_number":"14:15:16","opining_time":"14:15:16","closing_time":"14:12:12","images":["/images/resturants/HASSAN1.jpg"],"favorite":true}]
/// attraction_activities : [{"id":1,"address":"dfdf","coordinate_y":1,"coordinate_x":1,"city_name":"Damascus","nation_name":"Syrian Arab Republic","attraction_activity_name":"HASSAN","description":"required","opening_time":"16:00:00","closing_time":"16:00:00","images":["/images/attraction_activities/HASSAN1.jpg"],"favorite":true}]

class FavoriteModel {
  FavoriteModel({
      this.status, 
      this.message, 
      this.trips,
      this.hotels, 
      this.resturants, 
      this.attractionActivities,});

  FavoriteModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['trips'] != null) {
     trips = [];
      json['trips'].forEach((v) {
        trips?.add(TripsModelData.fromJson(v));
      });
    }
    if (json['hotels'] != null) {
      hotels = [];
      json['hotels'].forEach((v) {
        hotels?.add(HotelData.fromJson(v));
      });
    }
    if (json['resturants'] != null) {
      resturants = [];
      json['resturants'].forEach((v) {
        resturants?.add(RestaurantsModel.fromJson(v));
      });
    }
    if (json['attraction_activities'] != null) {
      attractionActivities = [];
      json['attraction_activities'].forEach((v) {
        attractionActivities?.add(AttractionActivitiesModel.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<TripsModelData>? trips;
  List<HotelData>? hotels;
  List<RestaurantsModel>? resturants;
  List<AttractionActivitiesModel>? attractionActivities;
FavoriteModel copyWith({  int? status,
  String? message,
  List<TripsModelData>? trips,
 
}) => FavoriteModel(  status: status ?? this.status,
  message: message ?? this.message,
  trips: trips ?? this.trips,
  hotels: hotels ?? this.hotels,
  resturants: resturants ?? this.resturants,
  attractionActivities: attractionActivities ?? this.attractionActivities,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
     if (trips != null) {
       map['trips'] = trips?.map((v) => v.toJson()).toList();
     }
    if (hotels != null) {
      map['hotels'] = hotels?.map((v) => v.toJson()).toList();
    }
    if (resturants != null) {
      map['resturants'] = resturants?.map((v) => v.toJson()).toList();
    }
    if (attractionActivities != null) {
      map['attraction_activities'] = attractionActivities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// address : "dfdf"
/// coordinate_y : 1
/// coordinate_x : 1
/// city_name : "Damascus"
/// nation_name : "Syrian Arab Republic"
/// attraction_activity_name : "HASSAN"
/// description : "required"
/// opening_time : "16:00:00"
/// closing_time : "16:00:00"
/// images : ["/images/attraction_activities/HASSAN1.jpg"]
/// favorite : true

class AttractionActivitiesModel {
  AttractionActivitiesModel({
      this.id, 
      this.address, 
      this.coordinateY, 
      this.coordinateX, 
      this.cityName, 
      this.nationName, 
      this.name, 
      this.description, 
      this.openingTime, 
      this.closingTime, 
      this.images, 
      this.favorite,});

  AttractionActivitiesModel.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'];
    coordinateX = json['coordinate_x'];
    cityName = json['city_name'];
    nationName = json['nation_name'];
    name = json['attraction_activity_name'];
    description = json['description'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    favorite = json['favorite'];
  }
  int? id;
  String? address;
  int? coordinateY;
  int? coordinateX;
  String? cityName;
  String? nationName;
  String? name;
  double? rating=0;
  String? description;
  String? openingTime;
  String? closingTime;
  List<String>? images;
  bool? favorite;
AttractionActivitiesModel copyWith({  int? id,
  String? address,
  int? coordinateY,
  int? coordinateX,
  String? cityName,
  String? nationName,
  String? name,

  String? description,
  String? openingTime,
  String? closingTime,
  List<String>? images,
  bool? favorite,
}) => AttractionActivitiesModel(  id: id ?? this.id,
  address: address ?? this.address,
  coordinateY: coordinateY ?? this.coordinateY,
  coordinateX: coordinateX ?? this.coordinateX,
  cityName: cityName ?? this.cityName,
  nationName: nationName ?? this.nationName,
  name: name ?? this.name,
  description: description ?? this.description,
  openingTime: openingTime ?? this.openingTime,
  closingTime: closingTime ?? this.closingTime,
  images: images ?? this.images,
  favorite: favorite ?? this.favorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['coordinate_y'] = coordinateY;
    map['coordinate_x'] = coordinateX;
    map['city_name'] = cityName;
    map['nation_name'] = nationName;
    map['attraction_activity_name'] = name;
    map['description'] = description;
    map['opening_time'] = openingTime;
    map['closing_time'] = closingTime;
    map['images'] = images;
    map['favorite'] = favorite;
    return map;
  }

}

/// id : 1
/// address : "dfdf"
/// coordinate_y : 1
/// coordinate_x : 1
/// city_name : "Damascus"
/// nation_name : "Syrian Arab Republic"
/// type_of_food : "dddddd"
/// descreption : "descreption"
/// resturant_name : "HASSAN"
/// resturant_class : 1.2
/// phone_number : "14:15:16"
/// opining_time : "14:15:16"
/// closing_time : "14:12:12"
/// images : ["/images/resturants/HASSAN1.jpg"]
/// favorite : true

class RestaurantsModel {
  RestaurantsModel({
      this.id, 
      this.address, 
      this.coordinateY, 
      this.coordinateX, 
      this.cityName, 
      this.nationName, 
      this.typeOfFood, 
      this.descreption, 
      this.name, 
      this.rating, 
      this.phoneNumber, 
      this.opiningTime, 
      this.closingTime, 
      this.images, 
      this.favorite,});

  RestaurantsModel.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'];
    coordinateX = json['coordinate_x'];
    cityName = json['city_name'];
    nationName = json['nation_name'];
    typeOfFood = json['type_of_food'];
    descreption = json['descreption'];
    name = json['resturant_name'];
    rating = json['resturant_class'];
    phoneNumber = json['phone_number'];
    opiningTime = json['opining_time'];
    closingTime = json['closing_time'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    favorite = json['favorite'];
  }
  int? id;
  String? address;
  int? coordinateY;
  int? coordinateX;
  String? cityName;
  String? nationName;
  String? typeOfFood;
  String? descreption;
  String? name;
  double? rating;
  String? phoneNumber;
  String? opiningTime;
  String? closingTime;
  List<String>? images;
  bool? favorite;
RestaurantsModel copyWith({  int? id,
  String? address,
  int? coordinateY,
  int? coordinateX,
  String? cityName,
  String? nationName,
  String? typeOfFood,
  String? descreption,
  String? name,
  double? rating,
  String? phoneNumber,
  String? opiningTime,
  String? closingTime,
  List<String>? images,
  bool? favorite,
}) => RestaurantsModel(  id: id ?? this.id,
  address: address ?? this.address,
  coordinateY: coordinateY ?? this.coordinateY,
  coordinateX: coordinateX ?? this.coordinateX,
  cityName: cityName ?? this.cityName,
  nationName: nationName ?? this.nationName,
  typeOfFood: typeOfFood ?? this.typeOfFood,
  descreption: descreption ?? this.descreption,
  name: name ?? this.name,
  rating: rating ?? this.rating,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  opiningTime: opiningTime ?? this.opiningTime,
  closingTime: closingTime ?? this.closingTime,
  images: images ?? this.images,
  favorite: favorite ?? this.favorite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['coordinate_y'] = coordinateY;
    map['coordinate_x'] = coordinateX;
    map['city_name'] = cityName;
    map['nation_name'] = nationName;
    map['type_of_food'] = typeOfFood;
    map['descreption'] = descreption;
    map['resturant_name'] = name;
    map['resturant_class'] = rating;
    map['phone_number'] = phoneNumber;
    map['opining_time'] = opiningTime;
    map['closing_time'] = closingTime;
    map['images'] = images;
    map['favorite'] = favorite;
    return map;
  }

}

/// id : 2
/// address : "Dubai"
/// coordinate_y : 55.188168
/// coordinate_x : 25.142211
/// city_name : "Dubai"
/// nation_name : "United Arab Emirates"
/// simple_description_about_hotel : "In a striking building overlooking the Arabian Gulf, this sprawling beachfront hotel is 11 minutes' walk from Burj Al Arab and 6 km from the Mall of the Emirates.\n                Upscale rooms with gulf views feature decor ranging from modern to muted, plus floor-to-ceiling windows"
/// hotel_name : "Jumeirah Beach Hotel"
/// hotel_class : 5
/// phone_number : "+971 4 366 5000"
/// images : ["/images/hotels/Jumeirah Beach Hotel1.jpg","/images/hotels/Jumeirah Beach Hotel2.jpg","/images/hotels/Jumeirah Beach Hotel3.jpg","/images/hotels/Jumeirah Beach Hotel4.jpg","/images/hotels/Jumeirah Beach Hotel5.jpg","/images/hotels/Jumeirah Beach Hotel6.jpg","/images/hotels/Jumeirah Beach Hotel7.jpg","/images/hotels/Jumeirah Beach Hotel8.jpg"]
/// services : ["Free wifi","Parking free","Buffer dinner","Breakfast"]
/// favorite : true


