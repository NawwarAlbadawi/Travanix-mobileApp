import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/authentication/data/models/check_email_model.dart';
import 'package:travanix/Features/authentication/data/repoes/check_email_before_rest_password.dart';

part 'check_email_state.dart';

class CheckEmailCubit extends Cubit<CheckEmailState> {
  CheckEmailCubit() : super(CheckEmailInitial());
  static CheckEmailCubit get(context)=>BlocProvider.of(context);

  late CheckEmailRepo emailRepo;

  void checkEmail({required String email})

  {
    emailRepo=CheckEmailRepo();
    emailRepo.checkEmail(email: email).fold(
        (err){
          emit(CheckEmailError(err: err.errMessage));
        },
        (model){
          emit(CheckEmailSuccess(model: model));
        }

    );
  }


}
