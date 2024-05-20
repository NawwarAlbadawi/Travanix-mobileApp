import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/authentication/data/repoes/reset_password_repo.dart';
import 'package:travanix/core/utils/cache_service.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context)=>BlocProvider.of(context);

  late ResetPasswordRepo passwordRepo;
  void resetPassword({
    required String password})
  {
    passwordRepo=ResetPasswordRepo();
    passwordRepo.resetPassword(password: password, token: CacheHelper.getFromCacheHelper('restPasswordToken')).fold(
        (error)
            {
              emit(ResetPasswordError());

            }
            ,
        (model)
        {
          emit(ResetPasswordSuccess());
        }

    );

  }

}
