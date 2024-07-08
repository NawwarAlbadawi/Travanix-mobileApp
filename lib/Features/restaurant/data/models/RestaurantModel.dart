import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';

/// status : 1
/// message : "resturants gets"
/// data : [{"id":1,"address":"dfdf","coordinate_y":1,"coordinate_x":1,"city_name":"Damascus","nation_name":"Syrian Arab Republic","type_of_food":"dddddd","descreption":"descreption","resturant_name":"HASSAN","resturant_class":1.2,"phone_number":"14:15:16","opining_time":"14:15:16","closing_time":"14:12:12","images":["/images/resturants/HASSAN1.jpg"],"favorite":true}]

class RestaurantModel {
  RestaurantModel({
      this.status, 
      this.message, 
      this.data,});

  RestaurantModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(RestaurantData.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<RestaurantData>? data;
RestaurantModel copyWith({  int? status,
  String? message,
  List<RestaurantData>? data,
}) => RestaurantModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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
/// type_of_food : "dddddd"
/// descreption : "descreption"
/// resturant_name : "HASSAN"
/// resturant_class : 1.2
/// phone_number : "14:15:16"
/// opining_time : "14:15:16"
/// closing_time : "14:12:12"
/// images : ["/images/resturants/HASSAN1.jpg"]
/// favorite : true

