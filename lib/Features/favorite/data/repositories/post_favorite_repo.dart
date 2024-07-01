
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class PostFavoriteRepo {

  Future<Either<Failure,bool>>changeHotelFavoriteStatus (Map<String,dynamic>data) async
  {
    try{
      await DioHelper.postData(url: 'touristPutDeleteFavorite',data: data);
      return const  Right(true);}
    catch (error) {
      print(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }

}