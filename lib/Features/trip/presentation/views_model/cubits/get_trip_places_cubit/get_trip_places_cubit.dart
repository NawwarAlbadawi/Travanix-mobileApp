import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';

import 'package:travanix/Features/trip/data/model/places_item_model.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/trip/data/repositories/get_places_repo.dart';
import 'package:travanix/core/utils/routers.dart';

import '../../../../../hotels/data/models/hotel_data_model.dart';
import '../../../../../tourist_places/data/models/tourist_places_model_data.dart';

part 'get_trip_places_state.dart';

class GetTripPlacesCubit extends Cubit<GetTripPlacesState> {
  GetTripPlacesCubit(this._getPlacesRepo) : super(GetTripPlacesInitial());

  static GetTripPlacesCubit get(context)=>BlocProvider.of(context);

  final GetPlacesRepo _getPlacesRepo ;

  HotelData ? hotelData;
  List<PlacesItemModel> items=[];

  Future<void>getHotel(int ? id) async
  {
    emit(GetHotelLoading());


    await _getPlacesRepo.getHotel(id??0).fold(

            (left)
        {
          print(left.errMessage);
          emit(GetHotelFails(error: left.errMessage));
        },
            (hotelModel) {
          hotelData = hotelModel;
          items.add(PlacesItemModel(
             title: 'Hotel',
              text: hotelModel.name, icon:FontAwesomeIcons.hotel,
              router: AppRouter.hotelView,model:hotelModel));

          emit(GetHotelSuccess());
        }
    );
  }


  RestaurantData ? restaurantData;



  Future<void>getRestaurant(int ? id) async
  {
    emit(GetRestaurantLoading());

    await _getPlacesRepo.getRestaurant(id??0).fold(

            (left)
        {
          emit(GetRestaurantFails(error: left.errMessage));
        },
            (model) {
          restaurantData = model;

          items.add(PlacesItemModel(
            title: 'Restaurant',
              text: model.name,
              icon:FontAwesomeIcons.sackDollar,
              router: AppRouter.restaurantView,
              model: model));

          emit(GetRestaurantSuccess());
        }
    );
  }



 AttractionActivitiesModelData ? activitiesModel;
  Future<void>getTouristPlace(int  id) async
  {
    emit(GetAttractionActivitiesLoading());

    await _getPlacesRepo.getAttractionActivities(id).fold(

            (left)
        {
          emit(GetAttractionActivitiesFails(error: left.errMessage));
        },
            (model) {
          activitiesModel = model;

          items.add(PlacesItemModel(
              title:'Tourist place',
              text: model.name!,
              icon:CupertinoIcons.map,
              router: AppRouter.touristPlacesView,
              model: model));

          emit(GetAttractionActivitiesSuccess() );
        }
    );
  }

}
