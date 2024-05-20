
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/authentication/data/models/check_email_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class CheckEmailRepo {

Future<Either<Failure,CheckEmailModel>>checkEmail({required String email}) async
{
  try{
    var data=await  DioHelper.postData(url: 'touristCheckEmailPassword',
    data: {
      'Email_address':email
    });
    return Right(CheckEmailModel.fromJson(data.data));

  }
      catch(e)
  {
    if(e is DioException){
      return Left(ServerFailure.fromDioError(e));}
      return  Left(ServerFailure(e.toString()));}
}
  
}