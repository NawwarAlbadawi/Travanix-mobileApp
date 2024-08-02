import 'package:flutter/material.dart';
import 'package:travanix/Features/search/presentation/views/widgets/search_for_hotel_view_body.dart';
import 'package:travanix/Features/tourist_places/presentation/views/widgets/all_tourist_places_view_body.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/back_row_Icon.dart';
import 'package:travanix/core/widgets/custom_search_icon.dart';
class AllTouristPlacesView extends StatelessWidget {
  const AllTouristPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackRowIcon(),
        title:  Text('Discover all tourist places',style: AppTextStyles.styleSemiBold20(context),),
        actions: const  [
          CustomSearchIcon(searchBody: SearchForHotelViewBody(),width: 45,height: 45,iconSize: 22,radius: 15,),
           SizedBox(width: 5,)
        ],
      ),
      body:const  AllTouristPlacesViewBody(),
    );
  }
}
