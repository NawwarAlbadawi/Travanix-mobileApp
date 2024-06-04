part of 'get_all_hotel_cubit.dart';

@immutable
sealed class GetAllHotelState {}

final class GetAllHotelInitial extends GetAllHotelState {}

final class GetAllHotelLoading extends GetAllHotelState {}
final class GetAllHotelSuccess extends GetAllHotelState {


  GetAllHotelSuccess();

}
final class GetAllHotelFails extends GetAllHotelState {}

final class ChangeHotelFavoriteStatusSuccess extends GetAllHotelState{}

final class ChangeHotelFavoriteStatusFail extends GetAllHotelState{}