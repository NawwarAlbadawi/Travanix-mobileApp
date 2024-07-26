

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';
import 'package:travanix/core/utils/api_services.dart';
import 'package:travanix/core/utils/failure.dart';

class SearchForHotelRepo {

  Future<Either<Failure,List<HotelData>>> getSearchHotelResult ({ String ? name, String ?cityName ,String ? nationName,double?avgRate,double ? hotelClass}) async
  {

    try {

      var data=await DioHelper.getData(path: 'touristSearchHotel?',query: {
        'name':name,
        'city_name':cityName,
        'nation_name':nationName,
        'avg_rate' :avgRate==0?null:avgRate,
        'hotel_class':hotelClass==0?null:hotelClass,
        'address':null

      });
      List<HotelData>model=[];
      data.data['hotels'].forEach((value)
      {

        model.add(HotelData.fromJson(value));
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