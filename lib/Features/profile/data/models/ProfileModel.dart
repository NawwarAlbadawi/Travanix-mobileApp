/// tourist_name : "nawar"
/// Email_address : "nowar200342@gmail.com"
/// wallet : 0
/// created_at : "2024-06-04 11:54:33"
/// updated_at : "2024-06-04 11:54:33"

class ProfileModel {
  ProfileModel({
      this.touristName, 
      this.emailAddress, 
      this.wallet, 
      this.createdAt, 
      this.updatedAt,});

  ProfileModel.fromJson( Map<String,dynamic> json) {
    touristName = json['tourist_name'];
    emailAddress = json['Email_address'];
    wallet = json['wallet'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  String? touristName;
  String? emailAddress;
  int? wallet;
  String? createdAt;
  String? updatedAt;
ProfileModel copyWith({  String? touristName,
  String? emailAddress,
  int? wallet,
  String? createdAt,
  String? updatedAt,
}) => ProfileModel(  touristName: touristName ?? this.touristName,
  emailAddress: emailAddress ?? this.emailAddress,
  wallet: wallet ?? this.wallet,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tourist_name'] = touristName;
    map['Email_address'] = emailAddress;
    map['wallet'] = wallet;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}