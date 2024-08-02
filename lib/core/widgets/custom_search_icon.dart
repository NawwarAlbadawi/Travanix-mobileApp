
import 'package:flutter/material.dart%20';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/constants.dart';

import '../styles/app_colors.dart';
import '../utils/routers.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key, required this.searchBody, this.height, this.width, this.iconSize, this.radius,
  });
  final Widget searchBody;
  final double ?height;
  final double ? width;
  final double ? iconSize;
  final double ? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?? 50 ,
      width: width?? 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??20),
          color: basicColor,
          boxShadow: const  [

          ]
      ),
      child:  IconButton(icon:  Icon( FontAwesomeIcons.magnifyingGlass,
        color: Colors.white,
        size:iconSize?? 25,),
        onPressed: (){
          GoRouter.of(context).push(AppRouter.searchView,extra:   searchBody);
        },
      ),
    );
  }
}