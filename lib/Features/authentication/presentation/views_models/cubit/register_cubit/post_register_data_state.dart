part of 'post_register_data_cubit.dart';

@immutable
sealed class PostRegisterDataState {}

final class PostRegisterDataInitial extends PostRegisterDataState {}

final class PostRegisterDataSuccess extends PostRegisterDataState {

  final RegisterModel model;

  PostRegisterDataSuccess({required this.model});
}
final class PostRegisterDataLoading extends PostRegisterDataState {}
final class PostRegisterDataFail extends PostRegisterDataState {

 final String errorMessage;

  PostRegisterDataFail({required this.errorMessage});
}
