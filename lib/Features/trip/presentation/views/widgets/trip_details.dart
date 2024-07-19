import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:travanix/Features/Review/review_body.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/place_list_view.dart';
import 'package:travanix/Features/trip/presentation/views/widgets/trip_favorite_icon_button.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
import 'package:travanix/core/widgets/custom_decorated_container.dart';
import 'package:travanix/core/widgets/custom_draggable_scroll_sheet.dart';
import 'package:travanix/core/widgets/custom_item_box_location.dart';

import '../../../../../core/styles/app_colors.dart';
class TripDetails extends StatelessWidget {
  const TripDetails({super.key, required this.model});

  final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    return CustomDraggableScrollSheet(
      maxChildSize: 0.9,
      minChildSize: 0.52,
      initialChildSize: 0.52,

      builder: (context,scrollController)
      {
        return CustomDecoratedContainer(
          padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          scrollController: scrollController,
            decoration:const  BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                ),
                color: Colors.white
            ),
          child: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [

                    Text(model.name!,style: AppTextStyles.styleSemiBold24(context).copyWith(fontSize: 22 ),),
                    const Spacer(),
                    TripFavoriteIconButton(id: model.id!)
                  ],
                ),
                const SizedBox(height:5,),
                Row(
                  children: [
                    const  Icon(Icons.location_on_outlined,color: basicColor ,size: 20,),
                    const SizedBox(width: 5,),
                    Text(model.nationName!,style: AppTextStyles.styleMedium16(context),)
                  ],) ,
                const SizedBox(height: 20,),
                PlacesListView(model: model,),
                Text('Starting place',style: AppTextStyles.styleMedium18(context).copyWith(

                    fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 10,),
                CustomItemBoxLocation(model: model,shadow:const  BoxShadow(
                    color: CupertinoColors.extraLightBackgroundGray,
                    blurRadius: 2
                ),aspectRatio: 2.5,),
                const SizedBox(height: 10,),
                ReviewBody(category: 'trip_id', id: model.id!)


              ],),
          ),
        );
      },





    );
  }
}
