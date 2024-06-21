import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
 static late SharedPreferences  ?sharedPreferences ;


 static    initSharedPreferences () async{
     sharedPreferences=await SharedPreferences.getInstance();
  }

  static getFromCacheHelper(String value)
  {
    return  sharedPreferences!.get(value);
  }

  static Future<bool> setInCacheHelper({ required dynamic value,
  required String key}) async
  {
    if(value is int)
      {
        return await sharedPreferences!.setInt(key,value);
      }
    else if(value is String )
      {
        return await sharedPreferences!.setString(key,value);
      }
    else if(value is bool)
      {
        return await sharedPreferences!.setBool(key,value);
      }
    return await sharedPreferences!.setDouble(key,value);
  }

  static Future<bool> removeFromCacheHelper({required String key}) async
  {
   return  await  sharedPreferences!.remove(key) ;
  }

}