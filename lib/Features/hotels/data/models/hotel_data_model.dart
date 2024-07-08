
class HotelData {
  HotelData({
    required this.images,
    required this.address,
    required this.coordinateX,
    required this.coordinateY,

    required this.services,
    required this.nationName,
    required this.name,
    required this.rating,
    required this.cityName,
    required this.description,
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
  double  rating;
  String cityName;
  String description;
  String phoneNumber;
  int id;
  bool favorite;

  factory HotelData.fromJson(Map<dynamic, dynamic> json) => HotelData(
    images: List<String>.from(json["images"].map((x) => x)),
    address: json["address"],
    coordinateX: json["coordinate_x"],
    coordinateY: json["coordinate_y"],

    services: List<String>.from(json["services"].map((x) => x)),
    nationName: json["nation_name"],
    name: json["hotel_name"],
    rating: json["hotel_class"].toDouble(),
    cityName: json["city_name"],
    description: json["simple_description_about_hotel"],
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
    "simple_description_about_hotel": description,
    "phone_number": phoneNumber,
    "id": id,
    "favorite": favorite,
  };
}