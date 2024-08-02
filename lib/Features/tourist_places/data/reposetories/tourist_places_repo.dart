
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model.dart';
import 'package:travanix/Features/tourist_places/data/models/tourist_places_model_data.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class TouristPlacesRepo {


  Future<Either<Failure,TouristPlacesModel>> getTouristPlaces() async
  {
    try {
      var data = await DioHelper.getData(path: 'touristGetAttraction_activites');
      return Right(TouristPlacesModel.fromJson(data.data));
    }
    catch (error) {
      print(error.toString());

      if (error is DioException) {

        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }



  }

  Future<Either<Failure,bool>>changeRestaurantFavoriteStatus (Map<String,dynamic>data) async
  {
    try{
      await DioHelper.postData(url: 'touristPutDeleteFavorite',data: data);
      return const  Right(true);}
    catch (error) {
      print(error.toString());
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      }
      return Left(ServerFailure(error.toString()));
    }
  }
}