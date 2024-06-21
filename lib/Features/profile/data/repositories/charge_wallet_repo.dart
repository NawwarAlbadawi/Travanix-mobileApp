
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../core/utils/api_services.dart';
import '../../../../core/utils/failure.dart';

class ChargeWalletRepo {





  Future<Either<Failure,bool>>chargeWallet({required String code}) async
  {
    try {

      await DioHelper.postData(url: 'touristChargeCode',
      data: {
        'charge_code':code
      });

      return const Right(true);
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