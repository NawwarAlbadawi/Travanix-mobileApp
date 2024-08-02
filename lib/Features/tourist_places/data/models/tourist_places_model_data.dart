

class AttractionActivitiesModelData {
  AttractionActivitiesModelData({
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

  AttractionActivitiesModelData.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    coordinateY = json['coordinate_y'].toDouble();
    coordinateX = json['coordinate_x'].toDouble();
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
  double? coordinateY;
  double? coordinateX;
  String? cityName;
  String? nationName;
  String? name;
  double? rating=0;
  String? description;
  String? openingTime;
  String? closingTime;
  List<String>? images;
  bool? favorite;
  AttractionActivitiesModelData copyWith({  int? id,
    String? address,
    double? coordinateY,
    double? coordinateX,
    String? cityName,
    String? nationName,
    String? name,

    String? description,
    String? openingTime,
    String? closingTime,
    List<String>? images,
    bool? favorite,
  }) => AttractionActivitiesModelData(  id: id ?? this.id,
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