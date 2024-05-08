
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import 'package:travanix/Features/authentication/data/models/login_model.dart';
import 'package:travanix/core/utils/api_services.dart';

class LoginRepo{

  Future<Either<String,LoginModel>>postLoginData({required String email,required String password}) async
  {

    try{
     var data= await DioHelper.postData(url: 'login',
      data: {
        "Email_address_or_Phone_number":email,
        "Password":password
      }
      );
     return Right(LoginModel.fromJson(data.data));


    }
    catch(error)
    {
return Left(error.toString());
    }
  }



}