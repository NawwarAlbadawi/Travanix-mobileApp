import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../hotels/data/models/hotel_data_model.dart';
import '../../../data/Repositories/search_for_hotel_repo.dart';
part 'search_for_hotel_state.dart';

class SearchForHotelCubit extends Cubit<SearchForHotelState> {
  SearchForHotelCubit(this._searchRepo) : super(SearchForHotelInitial());

  static SearchForHotelCubit get(context) => BlocProvider.of(context);

  final SearchForHotelRepo _searchRepo;

  String countryValue = "";
  String ? stateValue = "";
  String ? cityValue = "";
  double avgRate = 0;
  int categoriesIndex = 0;
  int hotelClassIndex=-1;

  final TextEditingController controller = TextEditingController();

  Future<void> searchSomeThing() async
  {
    emit(SearchHotelLoading());
    await _searchRepo.getSearchHotelResult(
        name: controller.text,
        cityName: cityValue,
        nationName: countryValue,
        avgRate: avgRate,
        hotelClass: hotelClassIndex+1
    ).fold(
            (error) {
          emit(SearchHotelFail(
              error: error.errMessage
          ));
        },
            (model) {
          emit(SearchHotelSuccess(model: model));
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
  void changeHotelClass(int value) {
    hotelClassIndex = value;
    emit(ChangeHotelClassState());
  }


}