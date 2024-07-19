import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:travanix/core/styles/app_colors.dart';
class BackRowIcon extends StatelessWidget {
  const BackRowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon:const  Icon(Icons.arrow_back_ios,
        color: basicColor,),
      onPressed: (){

        GoRouter.of(context).pop();
      },
    );
  }
}
