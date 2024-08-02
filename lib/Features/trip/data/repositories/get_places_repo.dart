

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/hotels/data/models/hotel_data_model.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';
import '../../../favorite/data/models/FavoriteModel.dart';
import '../../../tourist_places/data/models/tourist_places_model_data.dart';

class GetPlacesRepo {

  Future<Either<Failure,HotelData>> getHotel (int id) async
  {

    try {

      var data=await DioHelper.getData(path: 'touristGetHotelById/$id');
      print(data.data['data']);

      return Right(HotelData.fromJson(data.data['data'][0]));

    }
    catch(error)
    {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }


  }



  Future<Either<Failure,RestaurantData>> getRestaurant (int id) async
  {

    try {

      var data=await DioHelper.getData(path: 'touristGetResturantById/$id');

      return Right(RestaurantData.fromJson(data.data['data'][0]));

    }
    catch(error)
    {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }


  }




  Future<Either<Failure,AttractionActivitiesModelData>> getAttractionActivities (int id) async
  {

    try {

      var data=await DioHelper.getData(path: 'touristGetAttraction_activiteById/$id');

      return Right(AttractionActivitiesModelData.fromJson(data.data['data'][0]));

    }
    catch(error)
    {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }


  }

}