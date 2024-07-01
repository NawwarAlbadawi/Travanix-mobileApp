import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/data/repositories/get_hotels_repo.dart';


part 'get_all_hotel_state.dart';

class GetAllHotelCubit extends Cubit<GetAllHotelState> {
  GetAllHotelCubit(this.repo) : super(GetAllHotelInitial());

  static GetAllHotelCubit get(context)=>BlocProvider.of(context);

  Map<int,bool>favorite={};
  HotelsModel ? hotelsModel;
   final GetHotelsRepo repo;
  
  void getAllHotel ()
  {

    emit(GetAllHotelLoading());
    

    
    repo.getHotels().fold(
        (error){

          emit(GetAllHotelFails());
        },
        (model)
        {
          for (var element in model.data) {
            favorite.addAll({
              element.id:element.favorite
            });
          }
          hotelsModel=model;
          emit(GetAllHotelSuccess());
        }
    );
    
  }



  void changeHotelFavoriteStatus(int index)
  {
    repo.changeHotelFavoriteStatus({
      'hotel_id':index
    }).fold((left) {

      emit(ChangeHotelFavoriteStatusFail());},
            (right) {
              favorite[index]=!favorite[index]!;
              getAllHotel();
              emit(ChangeHotelFavoriteStatusSuccess());
            });



  }

  
  
}
