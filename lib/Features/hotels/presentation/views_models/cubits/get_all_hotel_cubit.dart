import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/Features/hotels/data/repositories/get_hotels_repo.dart';
import 'package:travanix/Features/hotels/presentation/views_models/cubits/get_all_hotel_cubit.dart';

part 'get_all_hotel_state.dart';

class GetAllHotelCubit extends Cubit<GetAllHotelState> {
  GetAllHotelCubit(this.repo) : super(GetAllHotelInitial());

  static GetAllHotelCubit get(context)=>BlocProvider.of(context);

  Map<int,bool>favorite={};
  HotelsModel ? hotelsModel;
   final GetHotelsRepo repo;
  
  void getAllHotel ()
  {
    

    
    repo.getHotels().fold(
        (error){
          print(error.errMessage);
          emit(GetAllHotelFails());
        },
        (model)
        {
          model.data.forEach((element) {
            favorite.addAll({
              element.id:element.favorite
            });
          });
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
      print(left.errMessage);
      emit(ChangeHotelFavoriteStatusFail());},
            (right) {
              favorite[index]=!favorite[index]!;
              getAllHotel();
              emit(ChangeHotelFavoriteStatusSuccess());
            });



  }

  
  
}
