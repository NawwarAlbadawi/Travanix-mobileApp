import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travanix/Features/trip/data/model/places_item_model.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/data/repositories/get_places_repo.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trip_places_cubit/get_trip_places_cubit.dart';
import 'package:travanix/core/styles/app_colors.dart';
import 'package:travanix/core/styles/app_text_styles.dart';
class PlacesListView extends StatelessWidget {
  const PlacesListView({super.key, required this.model});
 final TripsModelData model;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>GetTripPlacesCubit(GetPlacesRepo())..getHotel(model.places![0].hotelId)..getRestaurant(model.places![0].restaurantId)..getTouristPlace(1),
      child: BlocBuilder<GetTripPlacesCubit,GetTripPlacesState>(
        builder: (context,state) {
          var cubit=GetTripPlacesCubit.get(context);
           if(cubit.items.isEmpty)
             {
               return const  Center(child:   CircularProgressIndicator());
             }

          return SizedBox(
            height: MediaQuery.sizeOf(context).height*0.09,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=> Padding(
                padding: EdgeInsets.only(left: index==0?8.0:15),
                child: PlacesListItem(model: cubit.items[index],),
              ),
            itemCount: cubit.items.length,),
          );
        }
      ),
    );
  }
}


class PlacesListItem extends StatelessWidget {
  const PlacesListItem({super.key, required this.model});
 final PlacesItemModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

          GoRouter.of(context).push(model.router,extra:model.model );

      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(

             height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: greyColor.withOpacity(0.6),
                  blurRadius: 5
                )
              ]
            ) ,
               child:Icon(model.icon,color: basicColor,size: 21,),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(model.title,style: AppTextStyles.styleRegular12(context),),

              Text(model.text,style: AppTextStyles.styleMedium14(context).copyWith(

                fontWeight: FontWeight.w600
              ),)
            ],
          )
        ],
      ),
    );
  }
}
