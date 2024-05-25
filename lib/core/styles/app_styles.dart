
 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travanix/core/styles/app_colors.dart';

 final appTheme=   ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      foregroundColor: Colors.white,
      iconTheme:  IconThemeData(
        color: basicColor
      )

    ),
   fontFamily: 'Exo',
 visualDensity: VisualDensity.adaptivePlatformDensity,



);