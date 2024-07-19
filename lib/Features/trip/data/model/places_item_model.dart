
import 'package:flutter/cupertino.dart';


class PlacesItemModel {

  final String text;
  final IconData icon;
  final String router;
  var model;
  final String title;

  PlacesItemModel({required this.title,  required this.text, required this.icon, required this.router,required this.model});

}