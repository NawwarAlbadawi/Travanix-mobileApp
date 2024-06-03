import 'package:flutter/material.dart';

import 'package:travanix/core/widgets/custom_material_button.dart';
class BookHotelRoomBar extends StatelessWidget {
  const BookHotelRoomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all( 10.0),
      child: CustomMaterialButton(onPressed: (){}, text:'Book Now',
        radius: 15,
        height: 50,
      ),
    );
  }
}
