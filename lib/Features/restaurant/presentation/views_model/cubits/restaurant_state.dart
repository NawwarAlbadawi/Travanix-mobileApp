part of 'restaurant_cubit.dart';

@immutable
sealed class RestaurantState {}

final class RestaurantInitial extends RestaurantState {}

final class GetAllRestaurantLoading extends RestaurantState {}
final class GetAllRestaurantSuccess extends RestaurantState {}
final class GetAllRestaurantFails   extends RestaurantState {
  final String error;

  GetAllRestaurantFails({required this.error});

}

final class ChangeRestaurantFavoriteStatusSuccess extends RestaurantState{}

final class ChangeRestaurantFavoriteStatusFail extends RestaurantState{}