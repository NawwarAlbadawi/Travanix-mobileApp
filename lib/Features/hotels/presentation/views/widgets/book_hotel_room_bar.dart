import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/core/utils/routers.dart';

import 'package:travanix/core/widgets/custom_material_button.dart';
class BookHotelRoomBar extends StatelessWidget {
  const BookHotelRoomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all( 10.0),
      child: CustomMaterialButton(onPressed: (){
        GoRouter.of(context).push(AppRouter.roomView);
      }, text:'Book Now',
        radius: 15,
        height: 50,
      ),
    );
  }
}
