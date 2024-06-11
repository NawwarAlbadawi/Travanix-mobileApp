import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/Review/data/repositories/review_repo.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.reviewRepo) : super(PostReviewInitial());

  static ReviewCubit get(context)=>BlocProvider.of(context);


   ReviewRepo reviewRepo;
  void postComment({required String category,required int id,required String comment})
  {
    reviewRepo=ReviewRepo();
    reviewRepo.postComment(comment: comment, category: category, id: id).fold(

        (error)
        {
          emit(PostCommentFail());
        },
        (value)
        {
          emit(PostCommentSuccess());
        }
    );

  }



  void postRate({required String category,required int id,required double rate})
  {
    reviewRepo=ReviewRepo();
    reviewRepo.postRate(rate: rate, category: category, id: id).fold(

            (error)
        {
          emit(PostRatingFail());
        },
            (value)
        {
          emit(PostRatingSuccess());
        }
    );

  }


}
