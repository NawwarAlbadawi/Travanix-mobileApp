part of 'post_to_favorite_cubit.dart';

@immutable
sealed class ChangeFavoriteStatusState {}

final class ChangeFavoriteStatusInitial extends ChangeFavoriteStatusState {}

final class ChangeFavoriteStatusFail extends ChangeFavoriteStatusState {}
final class ChangeFavoriteStatusSuccess extends ChangeFavoriteStatusState {}