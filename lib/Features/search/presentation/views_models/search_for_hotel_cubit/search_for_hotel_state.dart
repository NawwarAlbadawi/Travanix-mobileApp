part of 'search_for_hotel_cubit.dart';

@immutable
sealed class SearchForHotelState {}

final class SearchForHotelInitial extends SearchForHotelState {}






final class SearchHotelLoading extends SearchForHotelState {}

final class SearchHotelSuccess extends SearchForHotelState {

  final List<HotelData>model;

  SearchHotelSuccess({required this.model});
}


final class SearchHotelFail extends SearchForHotelState {
  final String error;

  SearchHotelFail({required this.error});
}


final class ChangeCountryState extends SearchForHotelState {}

final class ChangeCityState extends SearchForHotelState {}

final class ChangeSliderState extends SearchForHotelState {}

final class ChangeHotelClassState extends SearchForHotelState {}

