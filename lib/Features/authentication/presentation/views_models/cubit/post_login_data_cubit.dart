import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/authentication/data/models/login_model.dart';

import 'package:travanix/Features/authentication/data/repoes/login_repo.dart';


part 'post_login_data_state.dart';

class PostLoginDataCubit extends Cubit<PostLoginDataState> {
  PostLoginDataCubit() : super(PostLoginDataInitial());
  static PostLoginDataCubit get(context)=>BlocProvider.of(context);

 late LoginRepo repo ;
 late LoginModel model;


  Future<void>postLoginData({required String email,
  required String password}) async{
    repo=LoginRepo();
    emit(PostLoginDataLoadingState());
    print(email);
    var result=repo.postLoginData(email: email, password: password);



    result.fold(
        (error){
print(error);
          emit(PostLoginDataErrorState());
        }
            ,
        (loginModel){
          model=loginModel;
          print('post');
          emit(PostLoginDataSuccessState());

        }

    );
  }



}
