
class RestaurantData {
  RestaurantData({
    required this.rating,
    required this.description,
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
  String description;
  List<String> images;
  String address;
  double coordinateX;
  double coordinateY;
  String opiningTime;
  String nationName;
  String cityName;
  String typeOfFood;
  String closingTime;
  String name;
  String phoneNumber;
  int id;
  bool favorite;

  factory RestaurantData.fromJson(Map<dynamic, dynamic> json) => RestaurantData(
    rating: json["resturant_class"]?.toDouble(),
    description: json["descreption"],
    images: List<String>.from(json["images"].map((x) => x)),
    address: json["address"],
    coordinateX: json["coordinate_x"].toDouble(),
    coordinateY: json["coordinate_y"].toDouble(),
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
    "descreption": description,
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