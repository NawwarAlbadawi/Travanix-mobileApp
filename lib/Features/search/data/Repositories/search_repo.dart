
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/search/data/models/SearchModel.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class SearchRepo {
  
  Future<Either<Failure,SearchModel>> getSearchResult ({ String ? name, String ?address ,String ? nationName,double?avgRate}) async
  {


    try {
      var data=await DioHelper.getData(path: 'touristSearchAll?',query: {
        'name':name,
        'address':address,
        'nation_name':nationName,
        'avg_rate' :avgRate==0?null:avgRate
      });



      return Right(SearchModel.fromJson(data.data));
      
    }
    catch (error) {

      
      if (error is DioException) {

        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
    
  }
}