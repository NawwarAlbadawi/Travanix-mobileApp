
import 'package:flutter/material.dart%20';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../styles/app_colors.dart';
import '../utils/routers.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({
    super.key, required this.searchBody,
  });
  final Widget searchBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:50 ,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: basicColor,
          boxShadow: const  [

          ]
      ),
      child:  IconButton(icon: const Icon( FontAwesomeIcons.magnifyingGlass,
        color: Colors.white,
        size: 25,),
        onPressed: (){
          GoRouter.of(context).push(AppRouter.searchView,extra:   searchBody);
        },
      ),
    );
  }
}