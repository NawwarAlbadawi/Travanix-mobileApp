/// status : 1
/// message : "succes   "
/// data : [{"tourist_id":1,"tourist_name":"Nawwar Albadawi","Email_address":"nowar200342@gmail.com","hotel_id":1,"comment":"The best hotel ever","rate":4.43},{"tourist_id":1,"tourist_name":"Nawwar Albadawi","Email_address":"nowar200342@gmail.com","hotel_id":1,"comment":"Perfect place","rate":4.43}]

class GetReviewModel {
  GetReviewModel({
      this.status, 
      this.message, 
      this.data,});

  GetReviewModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(GetReviewModelData.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<GetReviewModelData>? data;
GetReviewModel copyWith({  int? status,
  String? message,
  List<GetReviewModelData>? data,
}) => GetReviewModel(  status: status ?? this.status,
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

/// tourist_id : 1
/// tourist_name : "Nawwar Albadawi"
/// Email_address : "nowar200342@gmail.com"
/// hotel_id : 1
/// comment : "The best hotel ever"
/// rate : 4.43

class GetReviewModelData {
  GetReviewModelData({
      this.touristId, 
      this.touristName, 
      this.emailAddress, 
      this.hotelId, 
      this.comment, 
      this.rate,});

  GetReviewModelData.fromJson(dynamic json) {
    touristId = json['tourist_id'];
    touristName = json['tourist_name'];
    emailAddress = json['Email_address'];
    hotelId = json['hotel_id'];
    comment = json['comment'];
    rate = json['rate'] ;
  }
  int? touristId;
  String? touristName;
  String? emailAddress;
  int? hotelId;
  String? comment;
  num? rate;
  GetReviewModelData copyWith({  int? touristId,
  String? touristName,
  String? emailAddress,
  int? hotelId,
  String? comment,
  double? rate,
}) => GetReviewModelData(  touristId: touristId ?? this.touristId,
  touristName: touristName ?? this.touristName,
  emailAddress: emailAddress ?? this.emailAddress,
  hotelId: hotelId ?? this.hotelId,
  comment: comment ?? this.comment,
  rate: rate ?? this.rate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tourist_id'] = touristId;
    map['tourist_name'] = touristName;
    map['Email_address'] = emailAddress;
    map['hotel_id'] = hotelId;
    map['comment'] = comment;
    map['rate'] = rate;
    return map;
  }

}