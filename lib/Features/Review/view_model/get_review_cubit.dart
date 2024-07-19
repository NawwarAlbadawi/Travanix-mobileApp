import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/Review/data/models/GetReviewModel.dart';
import 'package:travanix/Features/Review/data/repositories/get_review_repo.dart';

part 'get_review_state.dart';

class GetReviewCubit extends Cubit<GetReviewState> {
  GetReviewCubit() : super(GetReviewInitial());
 static GetReviewCubit get(context)=>BlocProvider.of(context);
 late GetReviewRepo repo;
 GetReviewModel?model;


  Future<void> getReview({required String category,required int id}) async
 {
   emit(GetReviewLoading());
   repo=GetReviewRepo();
   await repo.getReview(category: category, id: id).fold(

       (error){
         emit(GetReviewFails(error: error.errMessage));
       },
       (m){

         model=m;

         emit(GetReviewSuccess(model: m));
       }
   );
 }



}
