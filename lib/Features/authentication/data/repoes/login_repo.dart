
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:travanix/Features/authentication/data/models/login_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class LoginRepo{

  Future<Either<Failure,LoginModel>>postLoginData({required String email,required String password}) async
  {

    try{
     var data= await DioHelper.postData(url: 'touristLogin',
      data: {
        "Email_address":email,
        "Password":password
      }
      );
     return Right(LoginModel.fromJson(data.data));


    }
    catch(error)
    {
      if(error is DioException)
        {
          print(error.toString());
          return Left(ServerFailure.fromDioError(error));
        }
return Left(ServerFailure(error.toString()));
    }
  }



}