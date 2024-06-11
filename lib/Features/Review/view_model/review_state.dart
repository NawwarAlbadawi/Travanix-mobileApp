part of 'review_cubit.dart';


sealed class ReviewState {}

final class PostReviewInitial extends ReviewState {}

final class PostCommentLoading extends ReviewState {}
final class PostCommentSuccess extends ReviewState {}
final class PostCommentFail extends ReviewState {}

final class PostRatingLoading extends ReviewState {}
final class PostRatingSuccess extends ReviewState {}
final class PostRatingFail extends ReviewState {}