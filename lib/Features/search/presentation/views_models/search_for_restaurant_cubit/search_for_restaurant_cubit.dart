import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travanix/Features/restaurant/data/models/restaurant_data.dart';
import 'package:travanix/Features/search/data/Repositories/search_in_restaurant_repo.dart';
part 'search_for_restaurant_state.dart';

class SearchForRestaurantCubit extends Cubit<SearchForRestaurantState> {
  SearchForRestaurantCubit(this._searchInRestaurantRepo) : super(SearchForRestaurantInitial());
  static SearchForRestaurantCubit get(context) => BlocProvider.of(context);
  final SearchForRestaurantRepo _searchInRestaurantRepo;

  String countryValue = "";
  String ? stateValue = "";
  String ? cityValue = "";
  double avgRate = 0;
  int categoriesIndex = 0;

  final TextEditingController controller = TextEditingController();

  Future<void> searchSomeThing() async
  {
    emit(SearchRestaurantLoading());
    await _searchInRestaurantRepo.getSearchRestaurantResult(
        name: controller.text,
        cityName: cityValue,
        nationName: countryValue,
        avgRate: avgRate
    ).fold(
            (error) {
          emit(SearchRestaurantFail(
              error: error.errMessage
          ));
        },
            (model) {
          emit(SearchRestaurantSuccess(model: model));
        }
    );
  }

  void changeCountry(String country) {
    countryValue = country;
    emit(ChangeCountryState());
  }

  void changeCity(String ? city) {
    cityValue = city ?? '';
    emit(ChangeCityState());
  }

  void changeSlider(double value) {
    avgRate = value;
    emit(ChangeSliderState());
  }


}