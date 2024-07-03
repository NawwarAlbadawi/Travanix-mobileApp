

import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:travanix/Features/favorite/data/repositories/get_favorite_repo.dart';
import 'package:travanix/Features/favorite/data/repositories/post_favorite_repo.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';

import '../../../hotels/data/models/hotel_data_model.dart';
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
  List<HotelData>hotels=[];
  List<AttractionActivitiesModel>attractionActivity=[];
  List<RestaurantsModel>restaurants=[];
  Map<int,dynamic>categoriesMap={};

  void getFavorite ()
  {
    emit(GetFavoriteLoading());
    favoriteRepo
    .getFavorite().fold(

        (model){
          favoriteModel=model;
          emit(GetFavoriteSuccess());
        },
        (error)
        {

          emit(GetFavoriteFail());
        }
    );

  }




  final  PostFavoriteRepo postFavoriteRepo;

  void changeFavoriteStatus(int index)
  {

    postFavoriteRepo.changeHotelFavoriteStatus({

      getFavoriteCategory():index
    }).fold((left) {
      print(left.errMessage);
      emit(ChangeFavoriteStatusFail());

      },
            (right) {
          emit(ChangeFavoriteStatusSuccess());
        //  GetAllHotelCubit.get(context).favorite[id]=!GetAllHotelCubit.get(context).favorite[id];
          getFavorite();
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

}
