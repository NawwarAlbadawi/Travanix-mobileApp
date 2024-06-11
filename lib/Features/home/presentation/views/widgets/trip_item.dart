
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/utils/routers.dart';
import 'package:travanix/generated/assets.dart';

class TripItem extends StatelessWidget {
  const TripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push(AppRouter.tripView);
      },
      child: AspectRatio(
        aspectRatio: 1.5/2,
        child: PhysicalModel(
          color: greyColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
          elevation: 10,
          shadowColor: Colors.black,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage(
                          Assets.imagesTest,
      
                        ),
                    ),
      
      
                ),
      
      
      
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width*.055,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    color: Colors.red,
                    icon:  Icon(IconlyBold.heart,
                      size:MediaQuery.sizeOf(context).width*.07,
      
                    ),
                    onPressed: (){},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}