
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class ReviewRepo {

  Future<Either<Failure,bool>> postComment ({required String comment,required String category,required int  id}) async
  {
    try {
       await DioHelper.postData(url: 'touristPutComment',
       data: {
         category : id,
         "comment" : comment
       });
       return const  Right(true);

    }
    catch (error)
    {
      if (error is DioException) {

        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }

  }


  Future<Either<Failure,bool>> postRate ({required double rate,required String category,required int  id}) async
  {
    try {
      await DioHelper.postData(url: 'touristPutRate',
          data: {
            category : id,
            "rate" : rate
          });
      return const  Right(true);

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