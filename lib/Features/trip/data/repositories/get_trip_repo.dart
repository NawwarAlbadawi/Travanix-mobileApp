
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/trip/data/model/TripsModel.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class GetTripRepo {
  
Future<Either<Failure,TripsModel>> getTrips () async
{

  try {

    var data=await DioHelper.getData(path: 'touristGetTrips');

    return Right(TripsModel.fromJson(data.data));

  }
  catch(error)
  {
    if (error is DioException) {
      return Left(ServerFailure.fromDioError(error));
    }
    return Left(ServerFailure(error.toString()));
  }


}


Future<Either<Failure,bool>> changTripFavoriteState (int id) async
{


  try{
    await DioHelper.postData(url: 'touristPutDeleteFavorite',
        data: {
      'trip_id':id
        });
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