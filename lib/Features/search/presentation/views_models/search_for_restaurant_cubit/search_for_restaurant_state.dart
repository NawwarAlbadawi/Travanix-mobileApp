part of 'search_for_restaurant_cubit.dart';

@immutable
sealed class SearchForRestaurantState {}

final class SearchForRestaurantInitial extends SearchForRestaurantState {}


final class SearchRestaurantLoading extends SearchForRestaurantState {}

final class SearchRestaurantSuccess extends SearchForRestaurantState {

  final List<RestaurantData>model;

  SearchRestaurantSuccess({required this.model});
}


final class SearchRestaurantFail extends SearchForRestaurantState {
  final String error;

  SearchRestaurantFail({required this.error});
}


final class ChangeCountryState extends SearchForRestaurantState {}

final class ChangeCityState extends SearchForRestaurantState {}

final class ChangeSliderState extends SearchForRestaurantState {}