part of 'get_trips_cubit.dart';

@immutable
sealed class GetTripsState {}

final class GetTripsInitial extends GetTripsState {}

final class GetTripsLoading extends GetTripsState {}
final class GetTripsSuccess extends GetTripsState {}
final class GetTripsFails extends GetTripsState {
  final String error;

  GetTripsFails({required this.error});
}

final class ChangeTripFavoriteStateLoading extends GetTripsState {

}
final class ChangeTripFavoriteSuccess extends GetTripsState {

}
final class ChangeTripFavoriteFail extends GetTripsState {
  final String error;

  ChangeTripFavoriteFail({required this.error});
}




