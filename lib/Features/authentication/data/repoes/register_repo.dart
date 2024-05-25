
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/authentication/data/models/register_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class RegisterRepo
{

  Future<Either<Failure,RegisterModel>> postRegisterData({required String name,
  required String email,required String password}) async
  {
    
    try
        {
        var data= await DioHelper.postData(url: 'touristRegester',
          data: {
            "tourist_name" : name,
            "Email_address":email,
            "Password" :password
          
          
          });
        return Right(RegisterModel.fromJson(data.data));
          

        }
        catch ( error)
        {
          if(error is DioException)
            {
          return Left(ServerFailure.fromDioError(error));}
          else {
          return Left(ServerFailure(error.toString()));
          }

        }

    
    
  }



}