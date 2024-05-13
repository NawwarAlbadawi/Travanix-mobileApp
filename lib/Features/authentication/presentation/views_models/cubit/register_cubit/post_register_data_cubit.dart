import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/authentication/data/models/register_model.dart';
import 'package:travanix/Features/authentication/data/repoes/register_repo.dart';

part 'post_register_data_state.dart';

class PostRegisterDataCubit extends Cubit<PostRegisterDataState> {
  PostRegisterDataCubit() : super(PostRegisterDataInitial());


 late RegisterRepo repo ;

  void postRegisterData({
    required String email,
    required String password,
    required String name,
})
  {

    repo=RegisterRepo();

    repo.postRegisterData(name: name, email: email, password: password).fold(

        (e){
          emit(PostRegisterDataFail(errorMessage: e.errMessage));
        },
        (model){
          emit(PostRegisterDataSuccess(model: model));
        }

    );


  }
}
