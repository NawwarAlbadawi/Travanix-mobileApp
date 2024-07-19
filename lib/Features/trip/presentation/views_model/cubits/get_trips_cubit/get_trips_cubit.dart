import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/Features/trip/data/repositories/get_trip_repo.dart';

part 'get_trips_state.dart';

class GetTripsCubit extends Cubit<GetTripsState> {
  GetTripsCubit(this._tripRepo) : super(GetTripsInitial());
  static GetTripsCubit get(context)=>BlocProvider.of(context);
  final GetTripRepo _tripRepo ;

   TripsModel ? model;
   Map<int,bool>favorite={};

  Future<void>getTrips() async
  {
    emit(GetTripsLoading());
     await _tripRepo.getTrips().fold(

         (left)
             {

               emit(GetTripsFails(error: left.errMessage));
             },
         (tripModel) {
           model = tripModel;
           for (var value in model!.data!) {

             favorite.addAll({value.id!:value.favorite!});
           }
           emit(GetTripsSuccess());
         }
     );
  }


  Future<void>changeTripFavoriteState(int id) async
  {
    emit(ChangeTripFavoriteStateLoading());

    await _tripRepo.changTripFavoriteState(id).fold(
        (error){
          emit(ChangeTripFavoriteFail(error: error.errMessage));
        },
        (success){
          favorite[id]=!favorite[id]!;
          emit(ChangeTripFavoriteSuccess());
        });

  }



}
