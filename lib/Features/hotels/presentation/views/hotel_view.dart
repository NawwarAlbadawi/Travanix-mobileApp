
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/book_hotel_room_bar.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_favorite_button.dart';
import 'package:travanix/Features/hotels/presentation/views/widgets/hotel_view_body.dart';

import '../../data/models/hotel_data_model.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key, required this.hotelData});
  final HotelData hotelData;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.2),
            foregroundColor: Colors.white,
            child: IconButton(
              icon:const  Icon(FontAwesomeIcons.arrowLeft),
              onPressed: (){
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: HotelFavoriteButton(id: hotelData.id, borderRadius: 100,),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: HotelViewBody(
        pageController: PageController(),
        hotelData: hotelData,
      ),
      bottomNavigationBar: const BookHotelRoomButton(),

    );
  }
}
