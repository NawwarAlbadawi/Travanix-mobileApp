part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {}


final class SearchFail extends SearchState {
  final String error;

  SearchFail({required this.error});
}


final class ChangeCountryState extends SearchState {}

final class ChangeCityState extends SearchState {}

final class ChangeSliderState extends SearchState {}

final class ChangeCategoryIndexState extends SearchState {}