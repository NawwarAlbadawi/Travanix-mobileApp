import 'package:travanix/Features/favorite/data/models/FavoriteModel.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';

import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';

/// status : 1
/// message : "succes   "
/// trips : [{"id":8,"type_of_trip":"Funny","trip_name":"NawwarALbadawi","description":"trip to h","price_trip":11.2,"number_of_allSeat":44,"trip_start_time":"2024-06-03 20:55:41","trip_end_time":"2024-06-03 20:55:41","address":"trip","coordinate_y":43,"coordinate_x":34,"city_id":1,"city_name":"Damascus","nation_id":1,"nation_name":"Syrian Arab Republic","image":"/images/attraction_activities/Nawwar1.jpg","places":[{"hotel_id":1},{"attraction_activity_id":1}],"favorite":true,"number_of_seats_available":39}]
/// hotels : [{"id":1,"address":"Dubai","coordinate_y":55.185241156464,"coordinate_x":25.141418876386,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"A hotel that's home to cutting-edge engineering from the unique man-made beach and infinity pool terrace, to one of the tallest grand More","hotel_name":"Burj Al Arab","hotel_class":7,"phone_number":"+971 4 301 7777","images":["/images/hotels/Burj Al Arab1.jpg","/images/hotels/Burj Al Arab2.jpg","/images/hotels/Burj Al Arab3.jpg","/images/hotels/Burj Al Arab4.jpg","/images/hotels/Burj Al Arab5.jpg","/images/hotels/Burj Al Arab6.jpg","/images/hotels/Burj Al Arab7.jpg","/images/hotels/Burj Al Arab8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"],"favorite":true},{"id":2,"address":"Dubai","coordinate_y":55.188168,"coordinate_x":25.142211,"city_name":"Dubai","nation_name":"United Arab Emirates","simple_description_about_hotel":"In a striking building overlooking the Arabian Gulf, this sprawling beachfront hotel is 11 minutes' walk from Burj Al Arab and 6 km from the Mall of the Emirates.\n                Upscale rooms with gulf views feature decor ranging from modern to muted, plus floor-to-ceiling windows","hotel_name":"Jumeirah Beach Hotel","hotel_class":5,"phone_number":"+971 4 366 5000","images":["/images/hotels/Jumeirah Beach Hotel1.jpg","/images/hotels/Jumeirah Beach Hotel2.jpg","/images/hotels/Jumeirah Beach Hotel3.jpg","/images/hotels/Jumeirah Beach Hotel4.jpg","/images/hotels/Jumeirah Beach Hotel5.jpg","/images/hotels/Jumeirah Beach Hotel6.jpg","/images/hotels/Jumeirah Beach Hotel7.jpg","/images/hotels/Jumeirah Beach Hotel8.jpg"],"services":["Free wifi","Parking free","Buffer dinner","Breakfast"],"favorite":true}]
/// resturants : [{"id":1,"address":"Damascus","coordinate_y":55.185241156464,"coordinate_x":25.141418876386,"city_name":"Damascus","nation_name":"Syrian Arab Republic","type_of_food":"Casual Dining","descreption":"most luxurious and most beautiful hotels in the world. The Burj Al Arab Jumeirah Hotel is located on its own island and features suites with sea views, 8 distinct restaurants, a full- service spa and distinctive parking","resturant_name":"Divella Bistro Restaurant","resturant_class":4.2,"phone_number":"099286661","opining_time":"13:00:00","closing_time":"12:00:00","images":["/images/resturants/Divella Bistro Restaurant1.jpg"],"favorite":false}]
/// attraction_activities : [{"id":1,"address":"Damascus","coordinate_y":34,"coordinate_x":35,"city_name":"Damascus","nation_name":"Syrian Arab Republic","attraction_activity_name":"Nawwar","description":"Hello","opening_time":"16:00:00","closing_time":"16:00:00","images":["/images/attraction_activities/Nawwar1.jpg"],"favorite":false}]

class SearchModel {
  SearchModel({
      this.status, 
      this.message, 
      this.trips, 
      this.hotels, 
      this.restaurants,
      this.attractionActivities,});

  SearchModel.fromJson(dynamic json) {
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
      restaurants = [];
      json['resturants'].forEach((v) {
        restaurants?.add(RestaurantData.fromJson(v));
      });
    }
    if (json['attraction_activities'] != null) {
      attractionActivities = [];
      json['attraction_activities'].forEach((v) {
        attractionActivities?.add(AttractionActivitiesModelData.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<TripsModelData>? trips;
  List<HotelData>? hotels;
  List<RestaurantData>? restaurants;
  List<AttractionActivitiesModelData>? attractionActivities;
SearchModel copyWith({  int? status,
  String? message,
  List<TripsModelData>? trips,
  List<HotelData>? hotels,
  List<RestaurantData>? restaurants,
  List<AttractionActivitiesModelData>? attractionActivities,
}) => SearchModel(  status: status ?? this.status,
  message: message ?? this.message,
  trips: trips ?? this.trips,
  hotels: hotels ?? this.hotels,
  restaurants: restaurants ?? this.restaurants,
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
    if (restaurants != null) {
      map['resturants'] = restaurants?.map((v) => v.toJson()).toList();
    }
    if (attractionActivities != null) {
      map['attraction_activities'] = attractionActivities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


