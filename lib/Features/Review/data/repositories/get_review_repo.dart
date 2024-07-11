
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/Review/data/models/GetReviewModel.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class GetReviewRepo {

  Future<Either<Failure,GetReviewModel>> getReview ({required String category,required int  id}) async
  {
    try {


      var data=  await DioHelper.getData(path: 'touristGetAllRateAndComment',
          query: {
            category : id,

          });
      return   Right(GetReviewModel.fromJson(data.data));

    }
    catch (error)
    {

      if (error is DioException) {

        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }

  }

}