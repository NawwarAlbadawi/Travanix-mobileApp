/// trip_id : 4
/// number_of_seat : 2
/// phone_number : "093452893"
/// payment_status : "wallet"
/// detalis : [{"name":"hassan","age":21},{"name":"mahmod","age":21}]

class BookTripModel {
  BookTripModel({
      this.tripId, 
      this.numberOfSeat, 
      this.phoneNumber, 
      this.paymentStatus, 
      this.details,});

  BookTripModel.fromJson(dynamic json) {
    tripId = json['trip_id'];
    numberOfSeat = json['number_of_seat'];
    phoneNumber = json['phone_number'];
    paymentStatus = json['payment_status'];
    if (json['detalis'] != null) {
      details = [];
      json['detalis'].forEach((v) {
        details?.add(Details.fromJson(v));
      });
    }
  }
  int? tripId;
  int? numberOfSeat;
  String? phoneNumber;
  String? paymentStatus;
  List<Details>? details;
BookTripModel copyWith({  int? tripId,
  int? numberOfSeat,
  String? phoneNumber,
  String? paymentStatus,
  List<Details>? details,
}) => BookTripModel(  tripId: tripId ?? this.tripId,
  numberOfSeat: numberOfSeat ?? this.numberOfSeat,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  paymentStatus: paymentStatus ?? this.paymentStatus,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trip_id'] = tripId;
    map['number_of_seat'] = numberOfSeat;
    map['phone_number'] = phoneNumber;
    map['payment_status'] = paymentStatus;
    if (details != null) {
      map['detalis'] = details?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "hassan"
/// age : 21

class Details {
  Details({
      this.name, 
      this.age,});

  Details.fromJson(dynamic json) {
    name = json['name'];
    age = json['age'];
  }
  String? name;
  int? age;
Details copyWith({  String? name,
  int? age,
}) => Details(  name: name ?? this.name,
  age: age ?? this.age,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['age'] = age;
    return map;
  }

}