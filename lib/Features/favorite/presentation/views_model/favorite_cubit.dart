import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  static FavoriteCubit get(context)=>BlocProvider.of(context);

  int favoriteCategoryIndex=0;

  void changeFavoriteCategoryIndex(int index)
  {
    favoriteCategoryIndex=index;
    emit(ChangeFavoriteCategoryIndex());

  }


}
