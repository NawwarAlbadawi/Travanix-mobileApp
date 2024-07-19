
import 'dart:async';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/Review/data/repositories/review_repo.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.reviewRepo) : super(PostReviewInitial());

  static ReviewCubit get(context)=>BlocProvider.of(context);



   final ReviewRepo reviewRepo;
  Future<void> postComment({required String category,required int id,required String comment})async
  {
   await reviewRepo.postComment(comment: comment, category: category, id: id).fold(

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

double rate=0;

  Future<void> postRate({required String category,required int id}) async
  {

    await reviewRepo.postRate(rate: rate, category: category, id: id).fold(

            (error)
        {
          emit(PostRatingFail());
        },
            (value)
        {


        print('postrating');
          rate=0;

          emit(PostRatingSuccess());
          //getReview(category: category, id: id);


        }
    );


  }


  // late GetReviewRepo repo;
  // GetReviewModel?model;
  //
  //
  // Future<void> getReview({required String category,required int id}) async
  // {
  //   emit(GetReviewLoading());
  //   repo=GetReviewRepo();
  //   await repo.getReview(category: category, id: id).fold(
  //
  //           (error){
  //         emit(GetReviewFails(error: error.errMessage));
  //       },
  //           (m){
  //
  //         model=m;
  //
  //         emit(GetReviewSuccess());
  //       }
  //   );
  // }






}
