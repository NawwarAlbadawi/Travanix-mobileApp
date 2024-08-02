

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/utils/cache_service.dart';
const url='http://$ip:8001';
const ip ='192.168.1.116';
var  token =CacheHelper.getFromCacheHelper('token');
double basicRadius=15;

Map<String,IconData>hotelServicesIcons={
  'Wi-Fi':Icons.wifi_rounded,
  'Full-Service laundry':Icons.iron,
  'Game Room':CupertinoIcons.game_controller_solid,
  'Room service':Icons.room_service,
  'Fitness center':Icons.fitness_center,
  'Sauna':FontAwesomeIcons.steam,
  'Parking':Icons.local_parking_outlined,
  'Pool':Icons.pool_outlined,
  'Hair salon':CupertinoIcons.scissors_alt
};



