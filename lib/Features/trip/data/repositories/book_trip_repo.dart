
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class BookTripRepo {
  Future<Either<Failure,bool>> bookTrips (Map<String,dynamic>model) async
  {

    try {


       await DioHelper.postData(url: 'touristReserveTrip',
      data:model );


      return const  Right(true);

    }
    catch(error)
    {

      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }


  }
}