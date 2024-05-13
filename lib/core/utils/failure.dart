import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure{
  final String errMessage;

const Failure(this.errMessage);}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

   factory ServerFailure.fromDioError(DioException dioError)
  {
    switch (dioError.type)
        {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time out');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time out');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Time out');

      case DioExceptionType.badResponse:
      return  ServerFailure.fromBadResponse(dioError.response!.statusCode!, dioError.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        if(dioError.message!.contains('SocketException'))
          {
            return ServerFailure('No Internet Connection');
          }
         return ServerFailure('Unexpected Error, Please try again!');
        
        default: return ServerFailure('Opps There was an Error, Please try again');

    }




  }
  factory ServerFailure.fromBadResponse(int statusCode,dynamic response)
  {
    if(statusCode==400||statusCode==401||statusCode==403)
      {
        return ServerFailure(response['errors']['message']);
      }
    else if(statusCode==404)
      {
        return  ServerFailure('Your request not found, Please try later!');
      }
    else if(statusCode==500)
      {

        return ServerFailure('Internal Server error, Please try later');
      } else  if (statusCode ==422){
      return ServerFailure(response['message']);
    }
    else {return ServerFailure('Opps There was an Error, Please try again');}
  }


}