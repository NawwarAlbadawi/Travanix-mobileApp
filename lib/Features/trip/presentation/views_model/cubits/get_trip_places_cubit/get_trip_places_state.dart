part of 'get_trip_places_cubit.dart';

@immutable
sealed class GetTripPlacesState {}

final class GetTripPlacesInitial extends GetTripPlacesState {}



final class GetHotelLoading extends GetTripPlacesState {}
final class GetHotelSuccess extends GetTripPlacesState {}
final class GetHotelFails extends GetTripPlacesState {
  final String error;

  GetHotelFails({required this.error});
}



final class GetRestaurantLoading extends GetTripPlacesState {}
final class GetRestaurantSuccess extends GetTripPlacesState {}
final class GetRestaurantFails extends GetTripPlacesState {
  final String error;

  GetRestaurantFails({required this.error});
}



final class GetAttractionActivitiesLoading extends GetTripPlacesState {}
final class GetAttractionActivitiesSuccess extends GetTripPlacesState {}
final class GetAttractionActivitiesFails extends GetTripPlacesState {
  final String error;

  GetAttractionActivitiesFails({required this.error});
}