import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/utils/routers.dart';

import 'package:travanix/core/widgets/custom_material_button.dart';
class BookHotelRoomButton extends StatelessWidget {
  const BookHotelRoomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10,
        bottom: 5),
        child: CustomMaterialButton(onPressed: (){
          GoRouter.of(context).push(AppRouter.roomView);
        }, text:'Book Now',
          radius: 15,
          height: 50,
        ),
      ),
    );
  }
}
