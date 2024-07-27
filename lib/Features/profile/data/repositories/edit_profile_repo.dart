

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class EditProfileRepo {





  Future<Either<Failure,bool>>editProfile({ String ? name , String ? email}) async
  {
    try {

      await DioHelper.postData(url: 'touristUpdateProfile',
          data: {
            'tourist_name':name,
            'Email_address':email
            }
          );

      return const Right(true);
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