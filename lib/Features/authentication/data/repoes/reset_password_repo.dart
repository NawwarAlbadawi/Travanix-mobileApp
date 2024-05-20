
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/authentication/data/models/reset_password_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class ResetPasswordRepo {

  Future<Either<Failure,ResetPasswordModel>> resetPassword ({required String password,required String token })  async  {
    try{
    var data =await DioHelper.postData(url: 'touristChangePassword',
    token: token,
    data: {
      'Password':password
    });

    return Right(ResetPasswordModel.fromJson(data.data));

    }
    catch (error)
    {
      if(error is DioException)
        {
          return Left(ServerFailure.fromDioError(error));
        }
      return Left(ServerFailure(error.toString()));
    }
    
}

}