
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/favorite/data/repositories/get_favorite_repo.dart';
import 'package:travanix/Features/favorite/data/repositories/post_favorite_repo.dart';
import 'package:travanix/Features/restaurant/presentation/views_model/cubits/restaurant_cubit.dart';
import 'package:travanix/Features/trip/presentation/views_model/cubits/get_trips_cubit/get_trips_cubit.dart';
import '../../../hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';
import '../../data/models/FavoriteModel.dart';
part 'favorite_state.dart';
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.favoriteRepo, this.postFavoriteRepo) : super(FavoriteInitial());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  int favoriteCategoryIndex=0;

  void changeFavoriteCategoryIndex(int index)
  {
    favoriteCategoryIndex=index;
    emit(ChangeFavoriteCategoryIndex());

  }

  final GetFavoriteRepo favoriteRepo ;
  FavoriteModel ?favoriteModel ;


  Future<void> getFavorite () async
  {
    emit(GetFavoriteLoading());
   await favoriteRepo.getFavorite().fold(

        (model){
          favoriteModel=model;
          emit(GetFavoriteSuccess());
        },
        (error)
        {
          print(error.errMessage);

          emit(GetFavoriteFail(error: error.errMessage));
        }
    );

  }
  final  PostFavoriteRepo postFavoriteRepo;

  Future<void> changeFavoriteStatus(int index,BuildContext context) async
  {
  await  postFavoriteRepo.changeFavoriteStatus({

      getFavoriteCategory():index
    }).fold((left) {
      emit(ChangeFavoriteStatusFail());},
            (right) {
          emit(ChangeFavoriteStatusSuccess());
          getFavorite();
          getCategoryCubit(context);
    });
  }

  String getFavoriteCategory()
  {
    if(favoriteCategoryIndex==0)
      {
        return 'trip_id';
      }
    else if(favoriteCategoryIndex==1)
      {
        return 'hotel_id';
      }
    else if(favoriteCategoryIndex==2)
      {
        return 'resturant_id';
      }
    return 'attraction_activity_id';
  }

  dynamic getModel()
  {
    if(favoriteCategoryIndex==0)
      {
        return favoriteModel!.trips;
      }
    else if(favoriteCategoryIndex==1)
    {
      return favoriteModel!.hotels;
    }
    else if(favoriteCategoryIndex==2){
      return favoriteModel!.resturants;}
    return favoriteModel!.attractionActivities;
  }

  getCategoryCubit (BuildContext context)
  {
    if(favoriteCategoryIndex==0)
    {
     GetTripsCubit.get(context).getTrips();
    }
    else if(favoriteCategoryIndex==1)
    {
      GetAllHotelCubit.get(context).getAllHotel();
    }
    else if(favoriteCategoryIndex==2){
      RestaurantCubit.get(context).getAllRestaurant();
    }

  }







}
