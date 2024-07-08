import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:travanix/core/post_to_favorite_core/data/repository/change_favorite_status.dart';

part 'post_to_favorite_state.dart';

class PostToFavoriteCubit extends Cubit<ChangeFavoriteStatusState> {
  PostToFavoriteCubit() : super(ChangeFavoriteStatusInitial());

  Map<int,bool>favoriteHotels={};
  Map<int,bool>favoriteTrips={};
  Map<int,bool>favoriteRestaurants={};
  Map<int,bool>favoriteAttractionActivities={};

 late ChangeFavoriteStatusRepo _changeFavoriteStatusRepo;



  void changeFavoriteStatus(String category,int index,Map<int,bool>favorite)
  {
    _changeFavoriteStatusRepo=ChangeFavoriteStatusRepo();
    _changeFavoriteStatusRepo.changeFavoriteStatus({
      category:index
    }).fold((left) {

      emit(ChangeFavoriteStatusFail());},
            (right) {
          editFavoriteMap(category, favorite);

          emit(ChangeFavoriteStatusSuccess());
        });



  }

  void editFavoriteMap (String category,Map<int,bool>favorite) {
    if (category == 'hotel_id') {
      favoriteHotels=favorite;
    }
    else if(category=='resturant_id')
      {
        favoriteRestaurants=favorite;
      }
  }
}
