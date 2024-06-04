
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/profile/data/models/ProfileModel.dart';
import 'package:travanix/Features/profile/presentation/views/profile_view.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class ProfileRepo {
  
  Future<Either<Failure,ProfileModel>>getProfile() async
  {
    try {
      
      var data =await DioHelper.getData(path: 'touristProfile');

      return Right(ProfileModel.fromJson(data.data['data']));
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