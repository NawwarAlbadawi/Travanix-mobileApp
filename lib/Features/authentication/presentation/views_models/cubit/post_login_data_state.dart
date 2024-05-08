part of 'post_login_data_cubit.dart';

@immutable
sealed class PostLoginDataState {}

final class PostLoginDataInitial extends PostLoginDataState {}

final class PostLoginDataLoadingState extends PostLoginDataState {}
final class PostLoginDataSuccessState extends PostLoginDataState {}
final class PostLoginDataErrorState extends PostLoginDataState {}

