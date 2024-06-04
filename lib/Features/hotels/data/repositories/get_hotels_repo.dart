
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/hotels/data/models/hotels_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class GetHotelsRepo {

  Future<Either<Failure,HotelsModel>> getHotels() async
  {
    try {
      var data = await DioHelper.getData(path: 'touristGetHotels');



      return Right(HotelsModel.fromJson( data.data));
    }
    catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }



  }

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