part of 'get_all_hotel_cubit.dart';


sealed class GetAllHotelState {}

final class GetAllHotelInitial extends GetAllHotelState {}

final class GetAllHotelLoading extends GetAllHotelState {}
final class GetAllHotelSuccess extends GetAllHotelState {}
final class GetAllHotelFails extends GetAllHotelState {

  final String error;

  GetAllHotelFails({required this.error});
}

final class ChangeHotelFavoriteStatusSuccess extends GetAllHotelState{}

final class ChangeHotelFavoriteStatusFail extends GetAllHotelState{}