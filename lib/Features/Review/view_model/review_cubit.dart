
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travanix/Features/Review/data/repositories/review_repo.dart';
import 'package:travanix/Features/Review/view_model/get_review_cubit.dart';

import '../data/models/GetReviewModel.dart';
import '../data/repositories/get_review_repo.dart';
part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this.reviewRepo) : super(PostReviewInitial());

  static ReviewCubit get(context)=>BlocProvider.of(context);


   final ReviewRepo reviewRepo;
  void postComment({required String category,required int id,required String comment})
  {

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

double rate=0;

  void postRate({required String category,required int id})
  {

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
    rate=0;

  }









}
