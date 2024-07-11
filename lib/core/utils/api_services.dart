
import 'package:dio/dio.dart';
import 'package:travanix/constants.dart';

class DioHelper {
  static late Dio dio;
  static initDio()
  {
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://$ip:8001/api/',


      )
    );
  }

 static Future<Response<dynamic>>postData({Map <String,dynamic> ?data,
     required String url,
 String ?accessToken}) async
  {

    dio.options.headers=
    {
      'Authorization' :  'Bearer $token',
      'Content-Type':'application/json',
      'Accept':'application/json'
    };
    return await dio.post(url, data: data);
  }


  static Future<Response<dynamic>>getData({Map <String,dynamic> ?data,
    Map <String,dynamic> ?query,
  required String path}) async
  {

    dio.options.headers=
    {
      'Authorization' :  'Bearer $token',
      'Content-Type':'application/json',
      'Accept':'application/json'
    };
  return await  dio.get(path, data: data,queryParameters: query);

  }

}