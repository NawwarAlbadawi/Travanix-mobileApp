import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';
import 'package:travanix/Features/tourist_places/data/reposetories/tourist_places_repo.dart';

part 'get_tourist_places_state.dart';

class GetTouristPlacesCubit extends Cubit<GetTouristPlacesState> {
  GetTouristPlacesCubit(this.touristPlacesRepo) : super(GetTouristPlacesInitial());

  final TouristPlacesRepo touristPlacesRepo;

  static GetTouristPlacesCubit get(context)=>BlocProvider.of(context);

  Map<int,bool>favorite={};
  late TouristPlacesModel model;


  Future<void> getTouristPlaces () async
  {
    emit(GetTouristPlacesLoading());
    await touristPlacesRepo.getTouristPlaces().fold(
            (error){

          emit(GetTouristPlacesFails(error: error.errMessage));
        },
            (touristModel)
        {
          model=touristModel;
          for (var element in model.data) {
            favorite.addAll({
              element.id!:element.favorite!
            });
          }


          emit(GetTouristPlacesSuccess(model: model));
        }
    );

  }

  Future<void> changeTouristPlacesFavoriteStatus(int index) async
  {
    await touristPlacesRepo.changeRestaurantFavoriteStatus({
      'attraction_activity_id':index
    }).fold((left) {

      emit(ChangeTouristPlacesFavoriteStatusFail());},
            (right) {
          favorite[index]=!favorite[index]!;

          emit(ChangeTouristPlacesFavoriteStatusSuccess());
        });



  }
}
