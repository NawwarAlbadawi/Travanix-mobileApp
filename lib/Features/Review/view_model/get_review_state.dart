part of 'get_review_cubit.dart';

@immutable
sealed class GetReviewState {}

final class GetReviewInitial extends GetReviewState {}

final class GetReviewLoading extends GetReviewState {}
final class GetReviewSuccess extends GetReviewState {
  final GetReviewModel model;

  GetReviewSuccess({required this.model}){

    print(model.data!.length);
  }


}
final class GetReviewFails extends GetReviewState {

  final String error;


  GetReviewFails({required this.error});
}