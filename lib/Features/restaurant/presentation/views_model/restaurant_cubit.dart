import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/restaurant/data/models/RestaurantModel.dart';
import 'package:travanix/Features/restaurant/data/repositories/get_all_restaurants_repo.dart';

part 'restaurant_state.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantCubit(this.repo) : super(RestaurantInitial());

  static RestaurantCubit get(context)=>BlocProvider.of(context);

  Map<int,bool>favorite={};
  RestaurantModel ? restaurantModel;
  final GetAllRestaurantsRepo repo;

  void getAllRestaurant ()
  {
    emit(GetAllRestaurantLoading());
    repo.getRestaurant().fold(
            (error){

          emit(GetAllRestaurantFails());
        },
            (model)
        {
          for (var element in model.data!) {
            favorite.addAll({
              element.id:element.favorite
            });
          }
          print(favorite.length);
          restaurantModel=model;
          emit(GetAllRestaurantSuccess());
        }
    );

  }



  void changeRestaurantFavoriteStatus(int index)
  {
    repo.changeRestaurantFavoriteStatus({
      'resturant_id':index
    }).fold((left) {

      emit(ChangeRestaurantFavoriteStatusFail());},
            (right) {
              favorite[index]=!favorite[index]!;

          emit(ChangeRestaurantFavoriteStatusSuccess());
        });



  }

}
