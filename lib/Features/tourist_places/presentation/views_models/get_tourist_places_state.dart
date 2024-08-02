part of 'get_tourist_places_cubit.dart';

@immutable
sealed class GetTouristPlacesState {}

final class GetTouristPlacesInitial extends GetTouristPlacesState {}


final class GetTouristPlacesLoading extends GetTouristPlacesState {}
final class GetTouristPlacesSuccess extends GetTouristPlacesState {
  final TouristPlacesModel model;

  GetTouristPlacesSuccess({required this.model});
}
final class GetTouristPlacesFails extends GetTouristPlacesState {
  final String error;

  GetTouristPlacesFails({required this.error});
}


final class ChangeTouristPlacesFavoriteStatusSuccess extends GetTouristPlacesState{}

final class ChangeTouristPlacesFavoriteStatusFail extends GetTouristPlacesState{}