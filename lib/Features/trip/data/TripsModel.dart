/// status : 1
/// message : "trip gets"
/// data : [{"id":1,"type_of_trip":"HASSAN","trip_name":"sdfsdfsdfsdf","price_trip":11.2,"number_of_allSeat":44,"trip_start_time":"2024-06-03 20:55:41","trip_end_time":"2024-06-03 20:55:41","places":[{"hotel_id":1}],"favorite":false,"number_of_seats_available":44}]

class TripsModel {
  TripsModel({
      this.status, 
      this.message, 
      this.data,});

  TripsModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(TripsModelData.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<TripsModelData>? data;
TripsModel copyWith({  int? status,
  String? message,
  List<TripsModelData>? data,
}) => TripsModel(  status: status ?? this.status,
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
/// type_of_trip : "HASSAN"
/// trip_name : "sdfsdfsdfsdf"
/// price_trip : 11.2
/// number_of_allSeat : 44
/// trip_start_time : "2024-06-03 20:55:41"
/// trip_end_time : "2024-06-03 20:55:41"
/// places : [{"hotel_id":1}]
/// favorite : false
/// number_of_seats_available : 44

class TripsModelData {
  TripsModelData({
      this.id, 
      this.typeOfTrip, 
      this.tripName, 
      this.priceTrip, 
      this.numberOfAllSeat, 
      this.tripStartTime, 
      this.tripEndTime, 
      this.places, 
      this.favorite, 
      this.numberOfSeatsAvailable,});

  TripsModelData.fromJson(dynamic json) {
    id = json['id'];
    typeOfTrip = json['type_of_trip'];
    tripName = json['trip_name'];
    priceTrip = json['price_trip'];
    numberOfAllSeat = json['number_of_allSeat'];
    tripStartTime = json['trip_start_time'];
    tripEndTime = json['trip_end_time'];
    if (json['places'] != null) {
      places = [];
      json['places'].forEach((v) {
        places?.add(Places.fromJson(v));
      });
    }
    favorite = json['favorite'];
    numberOfSeatsAvailable = json['number_of_seats_available'];
  }
  int? id;
  String? typeOfTrip;
  String? tripName;
  double? priceTrip;
  int? numberOfAllSeat;
  String? tripStartTime;
  String? tripEndTime;
  List<Places>? places;
  bool? favorite;
  int? numberOfSeatsAvailable;
  TripsModelData copyWith({  int? id,
  String? typeOfTrip,
  String? tripName,
  double? priceTrip,
  int? numberOfAllSeat,
  String? tripStartTime,
  String? tripEndTime,
  List<Places>? places,
  bool? favorite,
  int? numberOfSeatsAvailable,
}) => TripsModelData(  id: id ?? this.id,
  typeOfTrip: typeOfTrip ?? this.typeOfTrip,
  tripName: tripName ?? this.tripName,
  priceTrip: priceTrip ?? this.priceTrip,
  numberOfAllSeat: numberOfAllSeat ?? this.numberOfAllSeat,
  tripStartTime: tripStartTime ?? this.tripStartTime,
  tripEndTime: tripEndTime ?? this.tripEndTime,
  places: places ?? this.places,
  favorite: favorite ?? this.favorite,
  numberOfSeatsAvailable: numberOfSeatsAvailable ?? this.numberOfSeatsAvailable,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type_of_trip'] = typeOfTrip;
    map['trip_name'] = tripName;
    map['price_trip'] = priceTrip;
    map['number_of_allSeat'] = numberOfAllSeat;
    map['trip_start_time'] = tripStartTime;
    map['trip_end_time'] = tripEndTime;
    if (places != null) {
      map['places'] = places?.map((v) => v.toJson()).toList();
    }
    map['favorite'] = favorite;
    map['number_of_seats_available'] = numberOfSeatsAvailable;
    return map;
  }

}

/// hotel_id : 1

class Places {
  Places({
      this.hotelId,});

  Places.fromJson(dynamic json) {
    hotelId = json['hotel_id'];
  }
  int? hotelId;
Places copyWith({  int? hotelId,
}) => Places(  hotelId: hotelId ?? this.hotelId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['hotel_id'] = hotelId;
    return map;
  }

}