
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/favorite/data/models/FavoriteModel.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class GetFavoriteRepo {
  
  Future<Either<FavoriteModel,Failure>>getFavorite() async{
    
    try {
      
      var data=await DioHelper.getData(path: 'touristGetAllFavorite');
      
      return Left(FavoriteModel.fromJson(data.data));
      
    }
    catch(error )
    {

      if (error is DioException) {

        return Right(ServerFailure.fromDioError(error));
      }
      return Right(ServerFailure(error.toString()));
    }
    
    
    
  }
  
  
  
  
  
}