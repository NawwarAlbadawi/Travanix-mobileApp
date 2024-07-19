part of 'favorite_cubit.dart';


sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class ChangeFavoriteCategoryIndex extends FavoriteState {}


final class GetFavoriteLoading extends FavoriteState {}
final class GetFavoriteSuccess extends FavoriteState {}
final class GetFavoriteFail extends FavoriteState {
  final String error;

  GetFavoriteFail({required this.error});
}



final class ChangeFavoriteStatusSuccess extends FavoriteState{}

final class ChangeFavoriteStatusFail extends FavoriteState{}