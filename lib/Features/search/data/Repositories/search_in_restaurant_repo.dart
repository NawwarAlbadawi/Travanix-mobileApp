import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';
class SearchForRestaurantRepo {

  Future<Either<Failure,List<RestaurantData>>> getSearchRestaurantResult ({ String ? name, String ?cityName ,String ? nationName,double?avgRate,double ? hotelClass}) async
  {

    try {
      var data=await DioHelper.getData(path: 'touristSearchResturant?',query: {
        'name':name,
        'city_name':cityName,
        'nation_name':nationName,
        'avg_rate' :avgRate,
        'resturant_class':hotelClass,
        'address':null,
        'type_of_food':null,
        'time':null
      });

      List<RestaurantData>model=[];
      data.data['resturants'].forEach((value)
      {

        model.add(RestaurantData.fromJson(value));
      });


      return Right(model);

    }
    catch (error) {

      if (error is DioException) {

        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }

  }
}