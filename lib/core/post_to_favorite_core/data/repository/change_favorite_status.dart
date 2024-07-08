
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../utils/api_services.dart';
import '../../../utils/failure.dart';

class ChangeFavoriteStatusRepo {

  Future<Either<Failure,bool>>changeFavoriteStatus (Map<String,dynamic>data) async
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